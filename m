Content-Type: multipart/mixed; boundary="===============5006557965644499721=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [pipe] d60337eff1: phoronix-test-suite.noise-level.0.activity_level 144.0% improvement
Date: Thu, 07 Nov 2019 08:51:50 -0800
Message-ID: <CAHk-=wiJ+jaT5Ev-wCg7iGNNO_JFUyMDcat0KDdA2b_+n_cZCQ@mail.gmail.com>
In-Reply-To: <20191107090306.GV29418@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5006557965644499721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2019 at 1:03 AM lkp report check <rong.a.chen@intel.com> w=
rote:
>
> FYI, we noticed a 144.0% improvement of phoronix-test-suite.noise-level.0=
.activity_level due to commit:
>
> commit: d60337eff18a3c587832ab8053a567f1da9710d2 ("[RFC PATCH 04/11] pipe=
: Use head and tail pointers for the ring, not cursor and length [ver #3]")

That sounds nice, but is odd. That commit really shouldn't change
anything noticeable. David, any idea?

               Linus
--===============5006557965644499721==--

