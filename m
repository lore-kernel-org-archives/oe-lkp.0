Content-Type: multipart/mixed; boundary="===============8654844544016701466=="
MIME-Version: 1.0
From: Josh Boyer <jwboyer@redhat.com>
To: lkp@lists.01.org
Subject: Re: [acpi] 41fa1ee9c6: kexec fails on v4.9
Date: Wed, 06 Nov 2019 09:29:56 -0500
Message-ID: <CANyg3HiyuHMu+nOKsk5Npa8pXTOYOZoDC7eQ5WrVvTUewtdaoA@mail.gmail.com>
In-Reply-To: <1738888c-f29b-65a8-f241-f3de691f8754@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8654844544016701466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2019 at 4:16 AM Rong Chen <rong.a.chen@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: 41fa1ee9c6d687afb05760dd349f361855f1d7f5 ("acpi: Ignore
> acpi_rsdp kernel param when the kernel has been locked down")
> url: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git mast=
er

I originally wrote that patch 5 years ago.  It's been carried along
and modified by others over the years until it was merged recently.
I've long since stopped kernel development, so if there is an issue it
likely needs to be resolved by someone more familiar with the current
state of the code.

josh

>
>
> in testcase: boot
>
>
> on test machine: Intel(R) Xeon(R) CPU @ 2.20GHz with 192G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
>
> We use the latest kexec and notice that kexec fails to boot kernel v5.2
> when the first kernel is v4.9,
> there's no problem if first kernel is v4.20.
>
> Thanks,
> Rong Chen

--===============8654844544016701466==--

