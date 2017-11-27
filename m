Content-Type: multipart/mixed; boundary="===============1447982171468350547=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [test_rht_init] INFO: task swapper/0:1 blocked for more than 120 seconds.
Date: Mon, 27 Nov 2017 13:34:55 -0800
Message-ID: <CA+55aFzouo1TKk9SOBL5Hht1p8R=MTn18wgW=0TmMDgBRUS23A@mail.gmail.com>
In-Reply-To: <20171121115228.v3z5vxaiirdh276q@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1447982171468350547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2017 at 3:52 AM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> Here is a different call trace related to rhashtable.
>
> It occurs in 17 out of 90 boots.
>
> [  342.666234] Writes:  Total: 4  Max/Min: 0/0   Fail: 0
> [  381.918047] INFO: task swapper/0:1 blocked for more than 120 seconds.

This looks very similar to the other lockup case: lock torture testing
and rhashtable testing at the same time, causing long long delays..

          Linus

--===============1447982171468350547==--

