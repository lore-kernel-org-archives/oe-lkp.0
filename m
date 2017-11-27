Content-Type: multipart/mixed; boundary="===============5784533610346222584=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [rht_deferred_worker] BUG: workqueue lockup - pool cpus=0 node=0 flags=0x0 nice=0 stuck for 62s!
Date: Mon, 27 Nov 2017 13:32:59 -0800
Message-ID: <CA+55aFyAjWZ2jOuasn6CfBiCkvafin036QL+Nb-xFmFWm4s0sw@mail.gmail.com>
In-Reply-To: <20171121111907.2i2caauehsdyhbs7@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5784533610346222584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2017 at 3:19 AM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
>
> FYI this happens in mainline kernel 4.14.0-10859-gcf9b077.
> It at least dates back to v4.5 .

Hmm. This seems to be doing some concurrent rhashtable stress testing,
while at the same time doing the RCU stress testing. All with a ton of
other debug options enabled too (ie lockdep etc).

And the result seems to just time out.

I'm inclined to say that this is just "too much testing". Together
with the "it's been going on for a while", I'm going to just ignore
it.

                Linus

--===============5784533610346222584==--

