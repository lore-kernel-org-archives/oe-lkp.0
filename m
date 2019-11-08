Content-Type: multipart/mixed; boundary="===============6835017379377240081=="
MIME-Version: 1.0
From: Ming Lei <tom.leiming@gmail.com>
To: lkp@lists.01.org
Subject: Re: [block] fa53228721: WARNING:at_block/blk-merge.c:#blk_rq_map_sg
Date: Fri, 08 Nov 2019 17:53:31 +0800
Message-ID: <CACVXFVMGR175kksqB6ux+=xRuVokA2bXOLidoT0=-AmCEgbk2Q@mail.gmail.com>
In-Reply-To: <20191108082244.GA29418@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6835017379377240081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2019 at 4:23 PM kernel test robot <lkp@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: fa53228721876515adabc7bc74368490bd97aa3b ("block: avoid blk_bio_s=
egment_split for small I/O operations")
> https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git for-5.=
5/block
>
> in testcase: xfstests
> with following parameters:
>
>         disk: 4HDD
>         fs: xfs
>         test: xfs-group16
>
> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +---------------------------------------------+------------+------------+
> |                                             | d2c9be89f8 | fa53228721 |
> +---------------------------------------------+------------+------------+
> | boot_successes                              | 12         | 0          |
> | boot_failures                               | 0          | 16         |
> | WARNING:at_block/blk-merge.c:#blk_rq_map_sg | 0          | 16         |
> | RIP:blk_rq_map_sg                           | 0          | 16         |
> | kernel_BUG_at_drivers/scsi/scsi_lib.c       | 0          | 16         |
> | invalid_opcode:#[##]                        | 0          | 16         |
> | RIP:scsi_init_io                            | 0          | 16         |
> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 16         |
> +---------------------------------------------+------------+------------+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
>
>
> [  203.892883] WARNING: CPU: 0 PID: 443 at block/blk-merge.c:559 blk_rq_m=
ap_sg+0x649/0x700

If the bvec crosses page boundary, and meantime its length is
<=3DPAGE_SIZE, this issue may be triggered, given
some device has PAGE_SIZE segment boundary limit.

The following patch should fix this issue:

diff --git a/block/blk-merge.c b/block/blk-merge.c
index f22cb6251d06..367d3358de2a 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -319,7 +319,8 @@ void __blk_queue_split(struct request_queue *q,
struct bio **bio,
                 */
                if (!q->limits.chunk_sectors &&
                    (*bio)->bi_vcnt =3D=3D 1 &&
-                   (*bio)->bi_io_vec[0].bv_len <=3D PAGE_SIZE) {
+                   ((*bio)->bi_io_vec[0].bv_len +
+                    (*bio)->bi_io_vec[0].bv_offset) <=3D PAGE_SIZE) {
                        *nr_segs =3D 1;
                        break;
                }

However, in case of 64K PAGE_SIZE, I guess this way is still not safe enoug=
h.

thanks,
Ming
--===============6835017379377240081==--

