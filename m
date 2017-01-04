Content-Type: multipart/mixed; boundary="===============0224436329139338420=="
MIME-Version: 1.0
From: Gabriel Krisman Bertazi <krisman@collabora.co.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] [drm] 75f6dfe3e6: BUG:unable_to_handle_kernel
Date: Wed, 04 Jan 2017 01:41:39 -0200
Message-ID: <87a8b7fq4s.fsf@dilma.collabora.co.uk>
In-Reply-To: <20170104004504.GA721@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0224436329139338420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <xiaolong.ye@intel.com> writes:

>
> on test machine: qemu-system-x86_64 -enable-kvm -m 320M
>
> caused below changes:
>

> [    1.608985] mwave: mwavedd::mwave_init: Error: Failed to initialize
> [    1.609295] Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 sec=
onds, margin is 60 seconds).
> [    1.609913] [drm] radeon kernel modesetting enabled.
> [    1.610407] BUG: unable to handle kernel NULL pointer dereference at 0=
000002c
> [    1.610833] IP: [<8143c0ba>] drm_dev_register+0xe9/0x173
> [    1.611131] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff53 =

> [    1.611427]

I believe this is already fixed by 6098909cf2d0 ("drm: Avoid NULL
dereference of drm_device.dev").  But right now the tip of the
drm-intel-nightly already includes that patch, so I'm not sure if the
test included it, I think not.

I gave it a try with the jobfile just to be sure on top of
drm-misc-next, and I couldn't reproduce the error anymore after applying
Chris' patch (but I could reproduce the Oops when trying only with my
patch).

Also, sorry for the noise and lesson learned about virtual devices :(

-- =

Gabriel Krisman Bertazi

--===============0224436329139338420==--

