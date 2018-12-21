Content-Type: multipart/mixed; boundary="===============2892094062947469252=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [bochs] df2052cc92: WARNING:at_drivers/gpu/drm/drm_mode_config.c:#drm_mode_config_cleanup
Date: Fri, 21 Dec 2018 11:25:41 -0800
Message-ID: <CAHk-=whM09ZxdrrN-o3k1JOAn0keF5aXtPAcEYiukn7kW7yp2g@mail.gmail.com>
In-Reply-To: <20181221083226.GI23332@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2892094062947469252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 21, 2018 at 12:32 AM kernel test robot
<rong.a.chen@intel.com> wrote:
>
> FYI, we noticed commit df2052cc9221 ("bochs: convert to
> drm_fb_helper_fbdev_setup/teardown") caused
>
> [  487.591733] WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_mode_config.=
c:478 drm_mode_config_cleanup+0x270/0x290

Ok, this is apparently just a leak for what appears to be a not
particularly interesting error case, but the warning is new to 4.20
(*) so it would be nice to have somebody look at it.

That commit is supposed to fix a leak, but there's apparently
something still there.

Daniel, Peter, Gerd?

                       Linus

(*) the *problem* is probably not new, it's just now exposed by the
switch to drm_mode_config_cleanup().

--===============2892094062947469252==--

