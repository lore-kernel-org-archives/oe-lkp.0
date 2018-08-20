Content-Type: multipart/mixed; boundary="===============8738526181636427153=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: ab9ee8e38b [ 22.890412] WARNING: CPU: 0 PID: 632 at mm/usercopy.c:81 usercopy_warn
Date: Sun, 19 Aug 2018 22:31:44 -0700
Message-ID: <CAGXu5jLHq_i-w2Tc75hkzV1VMO45vGyxsP=+670PLTiGEG7Acg@mail.gmail.com>
In-Reply-To: <20180820005204.GB31827@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8738526181636427153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 19, 2018 at 5:52 PM, kernel test robot
<rong.a.chen@intel.com> wrote:
> [   22.855033] Bad or missing usercopy whitelist? Kernel memory overwrite=
 attempt detected to SLUB object 'SCTP' (offset 1332, size 4)!

For this .config, pahole reports 1332 as the offset of the whitelist,
so I'm not sure what's happening here. It's as if no whitelist was
used when building the cache?

I'm still trying to build a reproducers...

-Kees

-- =

Kees Cook
Pixel Security

--===============8738526181636427153==--

