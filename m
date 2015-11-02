Content-Type: multipart/mixed; boundary="===============8033885172018046250=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs] df4c0e36f1: NMI watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:1]
Date: Mon, 02 Nov 2015 12:07:36 -0800
Message-ID: <5637C288.9070508@intel.com>
In-Reply-To: <CAPAsAGzpTM84NEESPt_jY0i-+W2SB37KtW1TXy93e8R2F7rEtw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8033885172018046250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/02/2015 11:34 AM, Andrey Ryabinin wrote:
>>> >>
>>> >> [    1.159450] augmented rbtree testing -> 23675 cycles
>>> >> [    1.864996]
>>> >> It took less than a second, meanwhile in your case it didn't finish =
in
>>> >> 22 seconds.
>>> >>
>>> >> This makes me think that your host is overloaded and the problem is =
on
>>> >> your side.
>> >
>> > It's probably just a matter of putting some cond_resched()s in the test
>> > code.
> Yes, but is it worthwhile? It's very likely that lockup will just
> trigger in another place.

I'm guessing that the lockup here was because the tests were running for
too long.  If we cond_resched() in there often enough, the kernel won't
detect a softlockup at all.  It won't shift somewhere else.

--===============8033885172018046250==--

