Content-Type: multipart/mixed; boundary="===============9142752544403706057=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/fixmap] b00b798255: BUG:unable_to_handle_kernel
Date: Wed, 13 Dec 2017 20:19:43 -0800
Message-ID: <CALCETrVc6rkQJ+G0RonuDRhshwoi-Hd3BCJtbFNN2ntvMpRPeQ@mail.gmail.com>
In-Reply-To: <20171214032950.GP1211@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============9142752544403706057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2017 at 7:29 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-6):
>
> commit: b00b798255eb414246718eeec93d1ef10f894445 ("x86/fixmap: Add LDT en=
tries to user-shared fixmap")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git WIP.x86/pti
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -m 512M
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>


I think the right solution is to drop this patch in favor of my series.

--===============9142752544403706057==--

