Content-Type: multipart/mixed; boundary="===============7595001539720388762=="
MIME-Version: 1.0
From: Edgecombe, Rick P <rick.p.edgecombe@intel.com>
To: lkp@lists.01.org
Subject: Re: 1f62a2b603 ("x86/alternative: Use temporary mm for text poking"): BUG: kernel NULL pointer dereference, address: 00000024
Date: Sat, 27 Apr 2019 13:50:06 +0000
Message-ID: <b3ef391ac54ace4b089c0affab67992e83c0a5d2.camel@intel.com>
In-Reply-To: <5ADA5D51-67E7-403F-B2C2-BD56E8205D34@vmware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7595001539720388762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-04-27 at 03:11 +0000, Nadav Amit wrote:
> > On Apr 26, 2019, at 5:37 PM, kernel test robot <lkp@intel.com>
> > wrote:
> > =

> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad
> > commit is
> > =

> > git://internal_merge_and_test_tree devel-catchup-201904262151
> > =

> > commit 1f62a2b603b4b0873eefa9ff73eb7bc784aa8c8d
> > Author:     Nadav Amit <namit@vmware.com>
> > AuthorDate: Thu Apr 25 17:11:27 2019 -0700
> > Commit:     Peter Zijlstra <peterz@infradead.org>
> > CommitDate: Fri Apr 26 15:33:23 2019 +0200
> > =

> >    x86/alternative: Use temporary mm for text poking
> =

> I forgot to take care of 32-bit. Strange, I was under the impression
> Rick
> ran some 0-day tests for it. I=E2=80=99ll send a revised patch later toda=
y.

It sent me some compile tests and sparse warnings, but nothing on 32
bit boot. It doesn't seem to always run every test, I'm not sure what
the logic is.

I did manually test 32 bit, but maybe it was before we merged.

--===============7595001539720388762==--

