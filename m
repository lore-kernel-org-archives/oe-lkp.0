Content-Type: multipart/mixed; boundary="===============9005114911815946108=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: lkp@lists.01.org
Subject: Re: 44693c7b10 ("clk: keystone: TI_SCI_PROTOCOL is needed for clk driver"): BUG: kernel reboot-without-warning in boot stage
Date: Wed, 21 Jun 2017 10:32:50 +0200
Message-ID: <CAK8P3a0Smk6FeStV34Ph0sJsJtB6f6BDkRSDYQPPYe5qgWUj3w@mail.gmail.com>
In-Reply-To: <594a2a3e.ZtbVhapbFuMvL9dQ%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9005114911815946108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2017 at 10:11 AM, kernel test robot
<fengguang.wu@intel.com> wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://github.com/0day-ci/linux/commits/Arnd-Bergmann/clk-keystone-TI_SC=
I_PROTOCOL-is-needed-for-clk-driver/20170621-135518
>
> commit 44693c7b10a06f9872daf39a7e303d35faad7b04
> Author:     Arnd Bergmann <arnd@arndb.de>
> AuthorDate: Tue Jun 20 22:12:37 2017 +0200
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Wed Jun 21 13:55:21 2017 +0800
>
>     clk: keystone: TI_SCI_PROTOCOL is needed for clk driver
>
>     CONFIG_COMPILE_TEST allows building a configuration without
>     TI_SCI_PROTOCOL, which then fails to link:
>
>     drivers/clk/keystone/sci-clk.o: In function `ti_sci_clk_probe':
>     sci-clk.c:(.text.ti_sci_clk_probe+0x4c): undefined reference to `devm=
_ti_sci_get_handle'
>
>     This makes it a hard dependency. Right now, that means we can't
>     actually compile-test the driver unless ARCH_KEYSTONE is set as
>     well, but we can fix that by allowing TI_MESSAGE_MANAGER to
>     be selected for COMPILE_TEST as well.
>
>     Fixes: b745c0794e2f ("clk: keystone: Add sci-clk driver support")
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> 4dea04c1f1  Merge tag 'meson-clk-for-4.13-2' of git://github.com/BayLibre=
/clk-meson into clk-next
> 44693c7b10  clk: keystone: TI_SCI_PROTOCOL is needed for clk driver
> 44693c7b10  clk: keystone: TI_SCI_PROTOCOL is needed for clk driver
> +-------------------------------------------------+------------+---------=
---+------------+
> |                                                 | 4dea04c1f1 | 44693c7b=
10 | 44693c7b10 |
> +-------------------------------------------------+------------+---------=
---+------------+
> | boot_successes                                  | 163        | 19      =
   | 19         |
> | boot_failures                                   | 0          | 2       =
   | 2          |
> | BUG:kernel_reboot-without-warning_in_boot_stage | 0          | 2       =
   | 2          |
> +-------------------------------------------------+------------+---------=
---+------------+
>
> [   46.831858] VFS: Warning: trinity-c0 using old stat() call. Recompile =
your binary.
> [   46.833720] mmap: trinity-c0 (1250) uses deprecated remap_file_pages()=
 syscall. See Documentation/vm/remap_file_pages.txt.
> [  105.608167] softdog: Initiating system reboot
>

Hi Fengguang,

I looked at the ouput but cannot make sense of it. My patch should have
no effect at all on x86, other than preventing a driver from being built th=
at
cannot be linked anyway.

The "failing" log output shows a trinity process that has managed to trigge=
r the
boot watchdog, while the "succeeding" one has triggered the OOM killer.

My best guess is that there is a bug somewhere that you accidentally
ran into during the testing, but it will only happen some of the time.

        Arnd

--===============9005114911815946108==--

