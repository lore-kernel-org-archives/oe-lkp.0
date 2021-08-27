Content-Type: multipart/mixed; boundary="===============7524980948383744375=="
MIME-Version: 1.0
From: Kirill A. Shutemov <kirill@shutemov.name>
To: lkp@lists.01.org
Subject: Re: [mm] f9ce0be71d: BUG:KCSAN:data-race_in_next_uptodate_page/next_uptodate_page
Date: Fri, 27 Aug 2021 18:42:32 +0300
Message-ID: <20210827154232.rrpetqsh5xxklkej@box.shutemov.name>
In-Reply-To: <20210826144157.GA26950@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7524980948383744375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2021 at 10:41:57PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with clang-14):
> =

> commit: f9ce0be71d1fbb038ada15ced83474b0e63f264d ("mm: Cleanup faultaroun=
d and finish_fault() codepaths")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> =

> in testcase: trinity
> version: =

> with following parameters:
> =

> 	number: 99999
> 	group: group-04
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------------=
+-----------+------------+
> |                                                                        =
| v5.11-rc4 | f9ce0be71d |
> +------------------------------------------------------------------------=
+-----------+------------+
> | BUG:KCSAN:data-race_in_next_uptodate_page/next_uptodate_page           =
| 0         | 19         |
> | BUG:KCSAN:data-race_in_mark_page_accessed/next_uptodate_page           =
| 0         | 17         |
> | BUG:KCSAN:data-race_in_next_uptodate_page/page_memcg                   =
| 0         | 13         |
> | BUG:KCSAN:data-race_in_next_uptodate_page/unlock_page                  =
| 0         | 13         |
> +------------------------------------------------------------------------=
+-----------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [  184.717904][ T1873] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  184.718938][ T1873] BUG: KCSAN: data-race in next_uptodate_page / unlo=
ck_page
> [  184.719828][ T1873]
> [  184.720103][ T1873] write (marked) to 0xffffea00050f37c0 of 8 bytes by=
 task 1872 on cpu 1:
> [  184.721024][ T1873]  unlock_page+0x102/0x1b0
> [  184.721533][ T1873]  filemap_map_pages+0x6c6/0x890
> [  184.722102][ T1873]  handle_mm_fault+0x179c/0x27f0
> [  184.722672][ T1873]  do_user_addr_fault+0x3fb/0x830
> [  184.723263][ T1873]  exc_page_fault+0xc3/0x1a0
> [  184.723845][ T1873]  asm_exc_page_fault+0x1e/0x30
> [  184.724427][ T1873]
> [  184.724720][ T1873] read to 0xffffea00050f37c0 of 8 bytes by task 1873=
 on cpu 0:
> [  184.725575][ T1873]  next_uptodate_page+0x456/0x830
> [  184.726161][ T1873]  filemap_map_pages+0x728/0x890
> [  184.726747][ T1873]  handle_mm_fault+0x179c/0x27f0
> [  184.727332][ T1873]  do_user_addr_fault+0x3fb/0x830
> [  184.727905][ T1873]  exc_page_fault+0xc3/0x1a0
> [  184.728440][ T1873]  asm_exc_page_fault+0x1e/0x30
> [  184.729027][ T1873]
> [  184.729313][ T1873] Reported by Kernel Concurrency Sanitizer on:
> [  184.730019][ T1873] CPU: 0 PID: 1873 Comm: systemd-udevd Not tainted 5=
.11.0-rc4-00001-gf9ce0be71d1f #1
> [  184.731103][ T1873] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Line annotation would be helpful.

And I'm not very familiar with KCSAN. My guess it reports PageLock() vs.
clearing PG_locked. In this context it looks safe, unless I miss
something.

Do we need some annotation to help KCSAN?

-- =

 Kirill A. Shutemov
--===============7524980948383744375==--

