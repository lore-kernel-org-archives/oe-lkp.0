Content-Type: multipart/mixed; boundary="===============2293797406864974989=="
MIME-Version: 1.0
From: Wei Yang <richardw.yang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [driver core] 570d020012: will-it-scale.per_thread_ops -12.2% regression
Date: Thu, 21 Feb 2019 11:46:12 +0800
Message-ID: <20190221034612.GA15147@richard>
In-Reply-To: <20190221031049.GE28258@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2293797406864974989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 21, 2019 at 11:10:49AM +0800, kernel test robot wrote:
>On Tue, Feb 19, 2019 at 01:19:04PM +0100, Greg Kroah-Hartman wrote:
>> On Tue, Feb 19, 2019 at 08:59:45AM +0800, Wei Yang wrote:
>> > On Mon, Feb 18, 2019 at 03:54:42PM +0800, kernel test robot wrote:
>> > >Greeting,
>> > >
>> > >FYI, we noticed a -12.2% regression of will-it-scale.per_thread_ops d=
ue to commit:
>> > >
>> > >
>> > >commit: 570d0200123fb4f809aa2f6226e93a458d664d70 ("driver core: move =
device->knode_class to device_private")
>> > >https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
>> > >
>> > =

>> > This is interesting.
>> > =

>> > I didn't expect the move of this field will impact the performance.
>> > =

>> > The reason is struct device is a hotter memory than device->device_pri=
vate?
>> > =

>> > >in testcase: will-it-scale
>> > >on test machine: 288 threads Knights Mill with 80G memory
>> > >with following parameters:
>> > >
>> > >	nr_task: 100%
>> > >	mode: thread
>> > >	test: unlink2
>> > >	cpufreq_governor: performance
>> > >
>> > >test-description: Will It Scale takes a testcase and runs it from 1 t=
hrough to n parallel copies to see if the testcase will scale. It builds bo=
th a process and threads based test in order to see any differences between=
 the two.
>> > >test-url: https://github.com/antonblanchard/will-it-scale
>> > >
>> > >In addition to that, the commit also has significant impact on the fo=
llowing tests:
>> > >
>> > >+------------------+-------------------------------------------------=
--------------+
>> > >| testcase: change | will-it-scale: will-it-scale.per_thread_ops -29.=
9% regression |
>> > >| test machine     | 288 threads Knights Mill with 80G memory        =
              |
>> > >| test parameters  | cpufreq_governor=3Dperformance                  =
                |
>> > >|                  | mode=3Dthread                                   =
                |
>> > >|                  | nr_task=3D100%                                  =
                |
>> > >|                  | test=3Dsignal1                                  =
                |
>> =

>> Ok, I'm going to blame your testing system, or something here, and not
>> the above patch.
>> =

>> All this test does is call raise(3).  That does not touch the driver
>> core at all.
>> =

>> > >+------------------+-------------------------------------------------=
--------------+
>> > >| testcase: change | will-it-scale: will-it-scale.per_thread_ops -16.=
5% regression |
>> > >| test machine     | 288 threads Knights Mill with 80G memory        =
              |
>> > >| test parameters  | cpufreq_governor=3Dperformance                  =
                |
>> > >|                  | mode=3Dthread                                   =
                |
>> > >|                  | nr_task=3D100%                                  =
                |
>> > >|                  | test=3Dopen1                                    =
                |
>> > >+------------------+-------------------------------------------------=
--------------+
>> =

>> Same here, open1 just calls open/close a lot.  No driver core
>> interaction at all there either.
>> =

>> So are you _sure_ this is the offending patch?
>
>Hi Greg,
>
>We did an experiment, recovered the layout of struct device. and we
>found the regression is gone. I guess the regession is not from the
>patch but related to the struct layout.
>
>
>tests: 1
>testcase/path_params/tbox_group/run: will-it-scale/performance-thread-100%=
-unlink2/lkp-knm01
>
>570d0200123fb4f8  a36dc70b810afe9183de2ea18f  =

>----------------  --------------------------  =

>         %stddev      change         %stddev
>             \          |                \  =

>    237096              14%     270789        will-it-scale.workload
>       823              14%        939        will-it-scale.per_thread_ops
>

Do you have the comparison between a36dc70b810afe9183de2ea18f and the one
before 570d020012?

>
>tests: 1
>testcase/path_params/tbox_group/run: will-it-scale/performance-thread-100%=
-signal1/lkp-knm01
>
>570d0200123fb4f8  a36dc70b810afe9183de2ea18f  =

>----------------  --------------------------  =

>         %stddev      change         %stddev
>             \          |                \  =

>     93.51 =C2=B1  3%        48%     138.53 =C2=B1  3%  will-it-scale.time=
.user_time
>       186              40%        261        will-it-scale.per_thread_ops
>     53909              40%      75507        will-it-scale.workload
>
>
>tests: 1
>testcase/path_params/tbox_group/run: will-it-scale/performance-thread-100%=
-open1/lkp-knm01
>
>570d0200123fb4f8  a36dc70b810afe9183de2ea18f  =

>----------------  --------------------------  =

>         %stddev      change         %stddev
>             \          |                \  =

>    447722              22%     546258 =C2=B1 10%  will-it-scale.time.invo=
luntary_context_switches
>    226995              19%     269751        will-it-scale.workload
>       787              19%        936        will-it-scale.per_thread_ops
>
>
>
>commit a36dc70b810afe9183de2ea18faa4c0939c139ac
>Author: 0day robot <lkp@intel.com>
>Date:   Wed Feb 20 14:21:19 2019 +0800
>
>    backfile klist_node in struct device for debugging
>    =

>    Signed-off-by: 0day robot <lkp@intel.com>
>
>diff --git a/include/linux/device.h b/include/linux/device.h
>index d0e452fd0bff2..31666cb72b3ba 100644
>--- a/include/linux/device.h
>+++ b/include/linux/device.h
>@@ -1035,6 +1035,7 @@ struct device {
> 	spinlock_t		devres_lock;
> 	struct list_head	devres_head;
> =

>+	struct klist_node       knode_class_test_by_rongc;
> 	struct class		*class;
> 	const struct attribute_group **groups;	/* optional groups */

Hmm... because this is not properly aligned?

struct klist_node {
	void			*n_klist;	/* never access directly */
	struct list_head	n_node;
	struct kref		n_ref;
};

Except struct kref has one "int" type, others are pointers.

But... I am still confused.

>
>Best Regards,
>Rong Chen

-- =

Wei Yang
Help you, Help me

--===============2293797406864974989==--

