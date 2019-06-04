Content-Type: multipart/mixed; boundary="===============0145732598488297745=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: Re: [block] 47cdee29ef: BUG:kernel_NULL_pointer_dereference, address
Date: Tue, 04 Jun 2019 12:03:57 +0800
Message-ID: <20190604040343.GB7208@ming.t460p>
In-Reply-To: <20190604020956.GC6576@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============0145732598488297745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rong Chen,

Thanks for your test & report!

On Tue, Jun 04, 2019 at 10:09:56AM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 47cdee29ef9d94e485eb08f962c74943023a5271 ("block: move blk_exit_q=
ueue into __blk_release_queue")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 2G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +-------------------------------------------------+------------+---------=
---+
> |                                                 | 31cb1d64da | 47cdee29=
ef |
> +-------------------------------------------------+------------+---------=
---+
> | boot_successes                                  | 3          | 0       =
   |
> | boot_failures                                   | 13         | 8       =
   |
> | BUG:kernel_reboot-without-warning_in_test_stage | 13         |         =
   |
> | BUG:kernel_NULL_pointer_dereference,address     | 0          | 8       =
   |
> | Oops:#[##]                                      | 0          | 8       =
   |
> | RIP:blk_mq_free_rqs                             | 0          | 8       =
   |
> | Kernel_panic-not_syncing:Fatal_exception        | 0          | 8       =
   |
> +-------------------------------------------------+------------+---------=
---+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> [    6.560544] BUG: kernel NULL pointer dereference, address: 00000000000=
00020
> [    6.561658] #PF: supervisor read access in kernel mode
> [    6.562495] #PF: error_code(0x0000) - not-present page
> [    6.563277] PGD 0 P4D 0 =

> [    6.563277] Oops: 0000 [#1] PTI
> [    6.563277] CPU: 0 PID: 147 Comm: kworker/0:2 Tainted: G              =
  T 5.2.0-rc1-00387-g47cdee29 #1
> [    6.563277] Workqueue: events __blk_release_queue
> [    6.563277] RIP: 0010:blk_mq_free_rqs+0x2c/0xaf


Looks there is race between removing queue and switching elevator, and
which should be done by Trinity.

I guess that commit 47cdee29ef9d94e485eb08f962c74943023a5271 just
changes the timing and makes it easy to trigger.

Please test the following patch and see if difference can be made.
If the patch can't fix the issue, please enable KASAN and reproduce,
then more useful log may be got.


diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 75b5281cc577..400a2102a4e4 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -848,11 +848,13 @@ static void blk_exit_queue(struct request_queue *q)
 	 * perform I/O scheduler exit before disassociating from the block
 	 * cgroup controller.
 	 */
+	mutex_lock(&q->sysfs_lock);
 	if (q->elevator) {
 		ioc_clear_queue(q);
 		elevator_exit(q, q->elevator);
 		q->elevator =3D NULL;
 	}
+	mutex_unlock(&q->sysfs_lock);
 =

 	/*
 	 * Remove all references to @q from the block cgroup controller before

Thanks,
Ming

--===============0145732598488297745==--

