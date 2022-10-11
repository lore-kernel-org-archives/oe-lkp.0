Content-Type: multipart/mixed; boundary="===============0177177088031205036=="
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
To: lkp@lists.01.org
Subject: Re: [kbuild] b3830bad81: System_halted
Date: Tue, 11 Oct 2022 23:42:46 +0900
Message-ID: <CAK7LNASFi-q-fbMq+3orWnJS6b3Yc7ZQAvRDNvwTSCj2UkP1MQ@mail.gmail.com>
In-Reply-To: <f09f2fb1-ae86-5419-4361-bdd8f8a22e11@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0177177088031205036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2022 at 6:37 PM Yujie Liu <yujie.liu@intel.com> wrote:
>
> On 10/11/2022 03:29, Masahiro Yamada wrote:
> > On Sun, Oct 9, 2022 at 10:21 AM kernel test robot <yujie.liu@intel.co=
m> wrote:
> >>
> >> Greeting,
> >>
> >> FYI, we noticed the following commit (built with gcc-11):
> >>
> >> commit: b3830bad81e872632431363853c810c5f652a040 ("[PATCH v3 2/8] kbui=
ld: rebuild .vmlinux.export.o when its prerequisite is updated")
> >> url: https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/Un=
ify-linux-export-h-and-asm-export-h-remove-EXPORT_DATA_SYMBOL-faster-TRIM_U=
NUSED_KSYMS/20220928-144539
> >> base: https://git.kernel.org/cgit/linux/kernel/git/masahiroy/linux-kbu=
ild.git for-next
> >> patch link: https://lore.kernel.org/linux-kbuild/20220928063947.299333=
-3-masahiroy(a)kernel.org
> >>
> >> in testcase: boot
> >>
> >> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp =
2 -m 16G
> >>
> >> caused below changes (please refer to attached dmesg/kmsg for entire l=
og/backtrace):
> >
> >
> > I think this is a false-positive alarm.
> >
> > As I replied before [1], I know my patch set is broken.
> > I think 0day bot is testing the patch set I had already retracted.
> >
> > I only picked up low-hanging fruits with fixes to my tree,
> > and did boot tests.
> >
> > Please let me know if linux-next is broken.
> >
> >
> > [1] : https://lore.kernel.org/linux-kbuild/CAK7LNATcD6k+R66YFVg_mhe7-FG=
Nc0nYaTPuORCcd34Qw3ra2g(a)mail.gmail.com/T/#t
> >
>
> Sorry for this false-positive report.
>
> Thanks for the info, we noticed that this patch has been merged into
> linux-next, so we tested below commits:
>
> b9f85101cad33 (tag: next-20221011, linux-next/master) Add linux-next spec=
ific files for 20221011
> 5d4aeffbf7092 kbuild: rebuild .vmlinux.export.o when its prerequisite is =
updated
>
> They all passed the boot tests.


Thank you for testing them!





-- =

Best Regards
Masahiro Yamada
--===============0177177088031205036==--

