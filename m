Content-Type: multipart/mixed; boundary="===============4814389599286399452=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: Re: [block] 47cdee29ef: BUG:kernel_NULL_pointer_dereference, address
Date: Tue, 04 Jun 2019 21:11:53 +0800
Message-ID: <20190604131152.GA17248@ming.t460p>
In-Reply-To: <20190604104326.GA22492@ming.t460p>
List-Id: <oe-lkp.lists.linux.dev>

--===============4814389599286399452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 06:43:27PM +0800, Ming Lei wrote:
> On Tue, Jun 04, 2019 at 05:06:44PM +0800, Rong Chen wrote:
> > Hi,
> > =

> > On 6/4/19 12:03 PM, Ming Lei wrote:
> > > Hi Rong Chen,
> > > =

> > > Thanks for your test & report!
> > > =

> > > On Tue, Jun 04, 2019 at 10:09:56AM +0800, kernel test robot wrote:
> > > > FYI, we noticed the following commit (built with gcc-7):
> > > > =

> > > > commit: 47cdee29ef9d94e485eb08f962c74943023a5271 ("block: move blk_=
exit_queue into __blk_release_queue")
> > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git mas=
ter
> > > > =

> > > > in testcase: trinity
> > > > with following parameters:
> > > > =

> > > > 	runtime: 300s
> > > > =

> > > > test-description: Trinity is a linux system call fuzz tester.
> > > > test-url: http://codemonkey.org.uk/projects/trinity/
> > > > =

> > > > =

> > > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -s=
mp 2 -m 2G
> > > > =

> > > > caused below changes (please refer to attached dmesg/kmsg for entir=
e log/backtrace):
> > > > =

> > > > =

> > > > +-------------------------------------------------+------------+---=
---------+
> > > > |                                                 | 31cb1d64da | 47=
cdee29ef |
> > > > +-------------------------------------------------+------------+---=
---------+
> > > > | boot_successes                                  | 3          | 0 =
         |
> > > > | boot_failures                                   | 13         | 8 =
         |
> > > > | BUG:kernel_reboot-without-warning_in_test_stage | 13         |   =
         |
> > > > | BUG:kernel_NULL_pointer_dereference,address     | 0          | 8 =
         |
> > > > | Oops:#[##]                                      | 0          | 8 =
         |
> > > > | RIP:blk_mq_free_rqs                             | 0          | 8 =
         |
> > > > | Kernel_panic-not_syncing:Fatal_exception        | 0          | 8 =
         |
> > > > +-------------------------------------------------+------------+---=
---------+
> > > > =

> > > > =

> > > > If you fix the issue, kindly add following tag
> > > > Reported-by: kernel test robot <rong.a.chen@intel.com>
> > > > =

> > > > =

> > > > [    6.560544] BUG: kernel NULL pointer dereference, address: 00000=
00000000020
> > > > [    6.561658] #PF: supervisor read access in kernel mode
> > > > [    6.562495] #PF: error_code(0x0000) - not-present page
> > > > [    6.563277] PGD 0 P4D 0
> > > > [    6.563277] Oops: 0000 [#1] PTI
> > > > [    6.563277] CPU: 0 PID: 147 Comm: kworker/0:2 Tainted: G        =
        T 5.2.0-rc1-00387-g47cdee29 #1
> > > > [    6.563277] Workqueue: events __blk_release_queue
> > > > [    6.563277] RIP: 0010:blk_mq_free_rqs+0x2c/0xaf
> > > =

> > > Looks there is race between removing queue and switching elevator, and
> > > which should be done by Trinity.
> > > =

> > > I guess that commit 47cdee29ef9d94e485eb08f962c74943023a5271 just
> > > changes the timing and makes it easy to trigger.
> > > =

> > > Please test the following patch and see if difference can be made.
> > > If the patch can't fix the issue, please enable KASAN and reproduce,
> > > then more useful log may be got.
> > =

> > The patch doesn't work, Attached please find the dmesg file with KASAN
> > enabled.
> =

> =

> Thanks for your test.
> =

> I think I can understand the issue now, it is because blk_mq_free_rqs()
> needs tag_set, however tag_set may have been freed.
> =

> In theory, we don't need tagset for freeing scheduler tags which is
> per-request-queue, not like driver tags.
> =

> However, the big trouble is that .exit_request() needs tagset, and this
> one is a generic issue, not limited to ide.
> =

> Give me a little time, I will investigate and see if good solution can be
> figured out. Otherwise, we may have to revert that commit.

Patch has been posted out:

https://lore.kernel.org/linux-block/20190604130802.17076-1-ming.lei(a)redha=
t.com/T/#u


Thanks,
Ming

--===============4814389599286399452==--

