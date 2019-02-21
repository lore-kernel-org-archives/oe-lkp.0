Content-Type: multipart/mixed; boundary="===============0032254212228686317=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [driver core] 570d020012: will-it-scale.per_thread_ops -12.2% regression
Date: Thu, 21 Feb 2019 15:18:22 +0800
Message-ID: <8736oh1uf5.fsf@yhuang-dev.intel.com>
In-Reply-To: <20190221071023.GA28637@kroah.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0032254212228686317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> On Thu, Feb 21, 2019 at 11:10:49AM +0800, kernel test robot wrote:
>> On Tue, Feb 19, 2019 at 01:19:04PM +0100, Greg Kroah-Hartman wrote:
>> > On Tue, Feb 19, 2019 at 08:59:45AM +0800, Wei Yang wrote:
>> > > On Mon, Feb 18, 2019 at 03:54:42PM +0800, kernel test robot wrote:
>> > > >Greeting,
>> > > >
>> > > >FYI, we noticed a -12.2% regression of will-it-scale.per_thread_ops=
 due to commit:
>> > > >
>> > > >
>> > > >commit: 570d0200123fb4f809aa2f6226e93a458d664d70 ("driver core: mov=
e device->knode_class to device_private")
>> > > >https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git ma=
ster
>> > > >
>> > > =

>> > > This is interesting.
>> > > =

>> > > I didn't expect the move of this field will impact the performance.
>> > > =

>> > > The reason is struct device is a hotter memory than device->device_p=
rivate?
>> > > =

>> > > >in testcase: will-it-scale
>> > > >on test machine: 288 threads Knights Mill with 80G memory
>> > > >with following parameters:
>> > > >
>> > > >	nr_task: 100%
>> > > >	mode: thread
>> > > >	test: unlink2
>> > > >	cpufreq_governor: performance
>> > > >
>> > > >test-description: Will It Scale takes a testcase and runs it from 1=
 through to n parallel copies to see if the testcase will scale. It builds =
both a process and threads based test in order to see any differences betwe=
en the two.
>> > > >test-url: https://github.com/antonblanchard/will-it-scale
>> > > >
>> > > >In addition to that, the commit also has significant impact on the =
following tests:
>> > > >
>> > > >+------------------+-----------------------------------------------=
----------------+
>> > > >| testcase: change | will-it-scale: will-it-scale.per_thread_ops -2=
9.9% regression |
>> > > >| test machine     | 288 threads Knights Mill with 80G memory      =
                |
>> > > >| test parameters  | cpufreq_governor=3Dperformance                =
                  |
>> > > >|                  | mode=3Dthread                                 =
                  |
>> > > >|                  | nr_task=3D100%                                =
                  |
>> > > >|                  | test=3Dsignal1                                =
                  |
>> > =

>> > Ok, I'm going to blame your testing system, or something here, and not
>> > the above patch.
>> > =

>> > All this test does is call raise(3).  That does not touch the driver
>> > core at all.
>> > =

>> > > >+------------------+-----------------------------------------------=
----------------+
>> > > >| testcase: change | will-it-scale: will-it-scale.per_thread_ops -1=
6.5% regression |
>> > > >| test machine     | 288 threads Knights Mill with 80G memory      =
                |
>> > > >| test parameters  | cpufreq_governor=3Dperformance                =
                  |
>> > > >|                  | mode=3Dthread                                 =
                  |
>> > > >|                  | nr_task=3D100%                                =
                  |
>> > > >|                  | test=3Dopen1                                  =
                  |
>> > > >+------------------+-----------------------------------------------=
----------------+
>> > =

>> > Same here, open1 just calls open/close a lot.  No driver core
>> > interaction at all there either.
>> > =

>> > So are you _sure_ this is the offending patch?
>> =

>> Hi Greg,
>> =

>> We did an experiment, recovered the layout of struct device. and we
>> found the regression is gone. I guess the regession is not from the
>> patch but related to the struct layout.
>> =

>> =

>> tests: 1
>> testcase/path_params/tbox_group/run: will-it-scale/performance-thread-10=
0%-unlink2/lkp-knm01
>> =

>> 570d0200123fb4f8  a36dc70b810afe9183de2ea18f  =

>> ----------------  --------------------------  =

>>          %stddev      change         %stddev
>>              \          |                \  =

>>     237096              14%     270789        will-it-scale.workload
>>        823              14%        939        will-it-scale.per_thread_o=
ps
>> =

>> =

>> tests: 1
>> testcase/path_params/tbox_group/run: will-it-scale/performance-thread-10=
0%-signal1/lkp-knm01
>> =

>> 570d0200123fb4f8  a36dc70b810afe9183de2ea18f  =

>> ----------------  --------------------------  =

>>          %stddev      change         %stddev
>>              \          |                \  =

>>      93.51   3%        48%     138.53   3%  will-it-scale.time.user_time
>>        186              40%        261        will-it-scale.per_thread_o=
ps
>>      53909              40%      75507        will-it-scale.workload
>> =

>> =

>> tests: 1
>> testcase/path_params/tbox_group/run: will-it-scale/performance-thread-10=
0%-open1/lkp-knm01
>> =

>> 570d0200123fb4f8  a36dc70b810afe9183de2ea18f  =

>> ----------------  --------------------------  =

>>          %stddev      change         %stddev
>>              \          |                \  =

>>     447722              22%     546258  10%  will-it-scale.time.involunt=
ary_context_switches
>>     226995              19%     269751        will-it-scale.workload
>>        787              19%        936        will-it-scale.per_thread_o=
ps
>> =

>> =

>> =

>> commit a36dc70b810afe9183de2ea18faa4c0939c139ac
>> Author: 0day robot <lkp@intel.com>
>> Date:   Wed Feb 20 14:21:19 2019 +0800
>> =

>>     backfile klist_node in struct device for debugging
>>     =

>>     Signed-off-by: 0day robot <lkp@intel.com>
>> =

>> diff --git a/include/linux/device.h b/include/linux/device.h
>> index d0e452fd0bff2..31666cb72b3ba 100644
>> --- a/include/linux/device.h
>> +++ b/include/linux/device.h
>> @@ -1035,6 +1035,7 @@ struct device {
>>  	spinlock_t		devres_lock;
>>  	struct list_head	devres_head;
>>  =

>> +	struct klist_node       knode_class_test_by_rongc;
>>  	struct class		*class;
>>  	const struct attribute_group **groups;	/* optional groups */
>
> While this is fun to worry about alignment and structure size of 'struct
> device' I find it odd given that the syscalls and userspace load of
> those test programs have nothing to do with 'struct device' at all.
>
> So I can work on fixing up the alignment of struct device, as that's a
> nice thing to do for systems with 30k of these in memory, but that
> shouldn't affect a workload of a constant string of signal calls.

Hi, Greg,

I don't think this is an issues of struct device.  As you said, struct
device isn't access much during test.  Struct device may share slab page
with some other data structures (signal related, or fd related (as in
some other test cases)), so that the alignment of these data structures
are affected, so caused the performance regression.

Best Regards,
Huang, Ying

> thanks,
>
> greg k-h

--===============0032254212228686317==--

