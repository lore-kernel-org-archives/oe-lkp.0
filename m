Content-Type: multipart/mixed; boundary="===============8613390865745285898=="
MIME-Version: 1.0
From: Wei Yang <richardw.yang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [driver core] 570d020012: will-it-scale.per_thread_ops -12.2% regression
Date: Thu, 21 Feb 2019 16:39:27 +0800
Message-ID: <20190221083926.GA7834@richard>
In-Reply-To: <87va1dzgpj.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8613390865745285898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 21, 2019 at 04:30:32PM +0800, Huang, Ying wrote:
>Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>
>> On Thu, Feb 21, 2019 at 03:18:22PM +0800, Huang, Ying wrote:
>>> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>>> =

>>> > On Thu, Feb 21, 2019 at 11:10:49AM +0800, kernel test robot wrote:
>>> >> On Tue, Feb 19, 2019 at 01:19:04PM +0100, Greg Kroah-Hartman wrote:
>>> >> > On Tue, Feb 19, 2019 at 08:59:45AM +0800, Wei Yang wrote:
>>> >> > > On Mon, Feb 18, 2019 at 03:54:42PM +0800, kernel test robot wrot=
e:
>>> >> > > >Greeting,
>>> >> > > >
>>> >> > > >FYI, we noticed a -12.2% regression of will-it-scale.per_thread=
_ops due to commit:
>>> >> > > >
>>> >> > > >
>>> >> > > >commit: 570d0200123fb4f809aa2f6226e93a458d664d70 ("driver core:=
 move device->knode_class to device_private")
>>> >> > > >https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.gi=
t master
>>> >> > > >
>>> >> > > =

>>> >> > > This is interesting.
>>> >> > > =

>>> >> > > I didn't expect the move of this field will impact the performan=
ce.
>>> >> > > =

>>> >> > > The reason is struct device is a hotter memory than device->devi=
ce_private?
>>> >> > > =

>>> >> > > >in testcase: will-it-scale
>>> >> > > >on test machine: 288 threads Knights Mill with 80G memory
>>> >> > > >with following parameters:
>>> >> > > >
>>> >> > > >	nr_task: 100%
>>> >> > > >	mode: thread
>>> >> > > >	test: unlink2
>>> >> > > >	cpufreq_governor: performance
>>> >> > > >
>>> >> > > >test-description: Will It Scale takes a testcase and runs it fr=
om 1 through to n parallel copies to see if the testcase will scale. It bui=
lds both a process and threads based test in order to see any differences b=
etween the two.
>>> >> > > >test-url: https://github.com/antonblanchard/will-it-scale
>>> >> > > >
>>> >> > > >In addition to that, the commit also has significant impact on =
the following tests:
>>> >> > > >
>>> >> > > >+------------------+-------------------------------------------=
--------------------+
>>> >> > > >| testcase: change | will-it-scale: will-it-scale.per_thread_op=
s -29.9% regression |
>>> >> > > >| test machine     | 288 threads Knights Mill with 80G memory  =
                    |
>>> >> > > >| test parameters  | cpufreq_governor=3Dperformance            =
                      |
>>> >> > > >|                  | mode=3Dthread                             =
                      |
>>> >> > > >|                  | nr_task=3D100%                            =
                      |
>>> >> > > >|                  | test=3Dsignal1                            =
                      |
>>> >> > =

>>> >> > Ok, I'm going to blame your testing system, or something here, and=
 not
>>> >> > the above patch.
>>> >> > =

>>> >> > All this test does is call raise(3).  That does not touch the driv=
er
>>> >> > core at all.
>>> >> > =

>>> >> > > >+------------------+-------------------------------------------=
--------------------+
>>> >> > > >| testcase: change | will-it-scale: will-it-scale.per_thread_op=
s -16.5% regression |
>>> >> > > >| test machine     | 288 threads Knights Mill with 80G memory  =
                    |
>>> >> > > >| test parameters  | cpufreq_governor=3Dperformance            =
                      |
>>> >> > > >|                  | mode=3Dthread                             =
                      |
>>> >> > > >|                  | nr_task=3D100%                            =
                      |
>>> >> > > >|                  | test=3Dopen1                              =
                      |
>>> >> > > >+------------------+-------------------------------------------=
--------------------+
>>> >> > =

>>> >> > Same here, open1 just calls open/close a lot.  No driver core
>>> >> > interaction at all there either.
>>> >> > =

>>> >> > So are you _sure_ this is the offending patch?
>>> >> =

>>> >> Hi Greg,
>>> >> =

>>> >> We did an experiment, recovered the layout of struct device. and we
>>> >> found the regression is gone. I guess the regession is not from the
>>> >> patch but related to the struct layout.
>>> >> =

>>> >> =

>>> >> tests: 1
>>> >> testcase/path_params/tbox_group/run: will-it-scale/performance-threa=
d-100%-unlink2/lkp-knm01
>>> >> =

>>> >> 570d0200123fb4f8  a36dc70b810afe9183de2ea18f  =

>>> >> ----------------  --------------------------  =

>>> >>          %stddev      change         %stddev
>>> >>              \          |                \  =

>>> >>     237096              14%     270789        will-it-scale.workload
>>> >>        823              14%        939        will-it-scale.per_thre=
ad_ops
>>> >> =

>>> >> =

>>> >> tests: 1
>>> >> testcase/path_params/tbox_group/run: will-it-scale/performance-threa=
d-100%-signal1/lkp-knm01
>>> >> =

>>> >> 570d0200123fb4f8  a36dc70b810afe9183de2ea18f  =

>>> >> ----------------  --------------------------  =

>>> >>          %stddev      change         %stddev
>>> >>              \          |                \  =

>>> >>      93.51   3%        48%     138.53   3%  will-it-scale.time.user_=
time
>>> >>        186              40%        261        will-it-scale.per_thre=
ad_ops
>>> >>      53909              40%      75507        will-it-scale.workload
>>> >> =

>>> >> =

>>> >> tests: 1
>>> >> testcase/path_params/tbox_group/run: will-it-scale/performance-threa=
d-100%-open1/lkp-knm01
>>> >> =

>>> >> 570d0200123fb4f8  a36dc70b810afe9183de2ea18f  =

>>> >> ----------------  --------------------------  =

>>> >>          %stddev      change         %stddev
>>> >>              \          |                \  =

>>> >>     447722              22%     546258  10%  will-it-scale.time.invo=
luntary_context_switches
>>> >>     226995              19%     269751        will-it-scale.workload
>>> >>        787              19%        936        will-it-scale.per_thre=
ad_ops
>>> >> =

>>> >> =

>>> >> =

>>> >> commit a36dc70b810afe9183de2ea18faa4c0939c139ac
>>> >> Author: 0day robot <lkp@intel.com>
>>> >> Date:   Wed Feb 20 14:21:19 2019 +0800
>>> >> =

>>> >>     backfile klist_node in struct device for debugging
>>> >>     =

>>> >>     Signed-off-by: 0day robot <lkp@intel.com>
>>> >> =

>>> >> diff --git a/include/linux/device.h b/include/linux/device.h
>>> >> index d0e452fd0bff2..31666cb72b3ba 100644
>>> >> --- a/include/linux/device.h
>>> >> +++ b/include/linux/device.h
>>> >> @@ -1035,6 +1035,7 @@ struct device {
>>> >>  	spinlock_t		devres_lock;
>>> >>  	struct list_head	devres_head;
>>> >>  =

>>> >> +	struct klist_node       knode_class_test_by_rongc;
>>> >>  	struct class		*class;
>>> >>  	const struct attribute_group **groups;	/* optional groups */
>>> >
>>> > While this is fun to worry about alignment and structure size of 'str=
uct
>>> > device' I find it odd given that the syscalls and userspace load of
>>> > those test programs have nothing to do with 'struct device' at all.
>>> >
>>> > So I can work on fixing up the alignment of struct device, as that's a
>>> > nice thing to do for systems with 30k of these in memory, but that
>>> > shouldn't affect a workload of a constant string of signal calls.
>>> =

>>> Hi, Greg,
>>> =

>>> I don't think this is an issues of struct device.  As you said, struct
>>> device isn't access much during test.  Struct device may share slab page
>>> with some other data structures (signal related, or fd related (as in
>>> some other test cases)), so that the alignment of these data structures
>>> are affected, so caused the performance regression.
>>
>> But allocation of a structure should always be "properly" aligned, no
>> matter what something else did in the system as that is what kmalloc
>> ensures.  If not, then we have problems in our memory allocator :)
>>
>> So something is odd here, but I don't think that is it...
>
>If all these data structure are allocated with kmalloc() instead of
>kmem_cache_alloc(), then my guessing above seems incorrect ...
>

Seems we don't have special kmem_cache for device and device_private.

>Best Regards,
>Huang, Ying

-- =

Wei Yang
Help you, Help me

--===============8613390865745285898==--

