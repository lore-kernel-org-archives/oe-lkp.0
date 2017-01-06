Content-Type: multipart/mixed; boundary="===============7854999312820066375=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH 0/4] lkp: add initial opensuse support
Date: Fri, 06 Jan 2017 13:58:05 -0600
Message-ID: <CAB=NE6UVm_UhiWu59eKBnM2cMZAJ23sudmBf9FKxgaNrXBQYBQ@mail.gmail.com>
In-Reply-To: <20170106190652.31544-1-mcgrof@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7854999312820066375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 6, 2017 at 1:06 PM, Luis R. Rodriguez <mcgrof@kernel.org> wro=
te:
> I received a failed test results notice from 0-day LKP test suite
> using trinity, however it was pretty hard to get reproduce given
> the LKP did not have OpenSUSE support to start off with, but the
> second issue I've stubmled upon is beyond me -- running either:
>
> ./bin/lkp qemu -k ~mcgrof/linux-next/arch/x86/boot/bzImage job-script
>
> or
>
> lkp qemu jobs/trinity.yaml
>
> ends up creating calling a few subroutines or files which are
> clearly not present, then tries to create a cpio archive but
> clearly there are a few files which LKP tree expects you to have
> and are not present such as lkp and lkp/scheduled.
>
> This is a run on OpenSUSE, first we install the dependencies for
> trinity.yaml deps:
>
>  # lkp install jobs/trinity.yaml
>
> Then we try to run it:
>
>  # lkp qemu jobs/trinity.yaml
> jobs/trinity.yaml: line 1: suite:: command not found
> jobs/trinity.yaml: line 2: testcase:: command not found
> jobs/trinity.yaml: line 4: runtime:: command not found
> jobs/trinity.yaml: line 6: kmsg:: command not found
> jobs/trinity.yaml: line 7: rootfs:: command not found
> jobs/trinity.yaml: line 9: trinity:: command not found
> make: Entering directory '/home/mcgrof/devel/lkp-tests/bin/event'
> klcc    -c -o wakeup.o wakeup.c
> klcc  -static -o wakeup wakeup.o
> rm -f wakeup.o
> strip wakeup
> make: Leaving directory '/home/mcgrof/devel/lkp-tests/bin/event'
> cpio: lkp: Cannot stat: No such file or directory
> cpio: lkp/scheduled: Cannot stat: No such file or directory
> cpio: blank line ignored
> cpio: File /dev/mqueue/=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD shrunk by 20 =
bytes, padding with zeros
>
> This never complets, it just sits there.

I just tried running all this on Debian and I run into the same exact
issue so as I suspected, this is not a distribution problem but rather
a bug in the code or some missing files in the repository:

# ./bin/lkp qemu -k ~mcgrof/linux-next/arch/x86/boot/bzImage job-script
or
# ./bin/lkp qemu -k ~mcgrof/linux-next/arch/x86/boot/bzImage jobs/trinity.y=
aml

yields:


The approx. disk space requirements are

10M             simple boot test in rootfs openwrt
50M             simple boot test in rootfs debian
1G              plan to run a number of different tests
100G or more    IO tests

Please enter a dir with enough disk space, or simply press Enter to
accept the default.
You may still symlink /root/.lkp to a more suitable place in future.
/root/.lkp =3D>
job-script: line 2: $'\r': command not found
job-script: line 3: syntax error near unexpected token `$'\r''
'ob-script: line 3: `export_top_env()
make: Entering directory '/home/mcgrof/devel/lkp-tests/bin/event'
klcc  -static -o wakeup wakeup.o
rm -f wakeup.o
strip wakeup
make: Leaving directory '/home/mcgrof/devel/lkp-tests/bin/event'
cpio: root:lkp: invalid group
cpio: root:lkp: invalid group
gzip: /root/.lkp/cache/lkp-x86_64.cpio: No such file or directory
mv: cannot stat '/root/.lkp/cache/lkp-x86_64.cpio.gz': No such file or dire=
ctory
mv: cannot stat '/root/.lkp/cache/lkp-x86_64.cgz': No such file or directory
cpio: lkp: Cannot stat: No such file or directory
cpio: lkp/scheduled: Cannot stat: No such file or directory
cpio: blank line ignored

And it just sits there without end.

  Luis

--===============7854999312820066375==--

