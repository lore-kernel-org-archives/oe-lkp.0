Content-Type: multipart/mixed; boundary="===============0064602060920619681=="
MIME-Version: 1.0
From: Nadav Amit <namit@vmware.com>
To: lkp@lists.01.org
Subject: Re: 1f62a2b603 ("x86/alternative: Use temporary mm for text poking"): BUG: kernel NULL pointer dereference, address: 00000024
Date: Sat, 27 Apr 2019 03:11:43 +0000
Message-ID: <5ADA5D51-67E7-403F-B2C2-BD56E8205D34@vmware.com>
In-Reply-To: <5cc3a462.OWSxa+Y7GRfZHTy3%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0064602060920619681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> On Apr 26, 2019, at 5:37 PM, kernel test robot <lkp@intel.com> wrote:
> =

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://internal_merge_and_test_tree devel-catchup-201904262151
> =

> commit 1f62a2b603b4b0873eefa9ff73eb7bc784aa8c8d
> Author:     Nadav Amit <namit@vmware.com>
> AuthorDate: Thu Apr 25 17:11:27 2019 -0700
> Commit:     Peter Zijlstra <peterz@infradead.org>
> CommitDate: Fri Apr 26 15:33:23 2019 +0200
> =

>    x86/alternative: Use temporary mm for text poking

I forgot to take care of 32-bit. Strange, I was under the impression Rick
ran some 0-day tests for it. I=E2=80=99ll send a revised patch later today.
--===============0064602060920619681==--

