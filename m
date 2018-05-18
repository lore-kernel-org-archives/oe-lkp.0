Content-Type: multipart/mixed; boundary="===============3819356390230627425=="
MIME-Version: 1.0
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [ALSA] e6a1b7e880: kmsg.parport#:cannot_grant_exclusive_access_for_device_portman
Date: Fri, 18 May 2018 22:40:31 +0100
Message-ID: <CADVatmPp=zSc+NqhhAsik1r_kvheUGrjwG8siX7fDfiwztxNvg@mail.gmail.com>
In-Reply-To: <20180517015410.GI4134@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3819356390230627425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xiaolong,

This is expected behaviour. lp0 has already registered with the
parport at 3.931898 sec.
So, when portman tries to register for exclusive access, it is denied
as another device has
already registered with the parport. And parport code says:
/*
 * If a device is already registered and this new
 * device wants exclusive access, then no need to
 * continue as we can not grant exclusive access to
 * this device.
 */

Similar error is with ks0108 also in your dmesg.

--
Regards
Sudip

On Thu, May 17, 2018 at 2:54 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: e6a1b7e88046055989b8b59c1d648fda4e606f34 ("ALSA: portman2x4 - use=
 new parport device model")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu Nehalem -smp 2 -m 51=
2M
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> [    4.394883] parport0: cannot grant exclusive access for device portman
>
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
>
>
>
> Thanks,
> Xiaolong

--===============3819356390230627425==--

