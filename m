Content-Type: multipart/mixed; boundary="===============7985978633239129596=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86/mm/pat] 8d04a5f97a: phoronix-test-suite.glmark2.0.score -23.7% regression
Date: Sat, 30 Nov 2019 14:35:06 -0800
Message-ID: <CAHk-=wh--xwpatv_Rcp3WtCPQtg-RVoXYQj8O+1TSw8os7Jtvw@mail.gmail.com>
In-Reply-To: <CAJTyqKOp+mV1CfpasschSDO4vEDbshE4GPCB6+aX4rJOYSF=7A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7985978633239129596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 30, 2019 at 2:09 PM Mariusz Ceier <mceier@gmail.com> wrote:
>
> Contents of /sys/kernel/debug/x86/pat_memtype_list on master
> (32ef9553635ab1236c33951a8bd9b5af1c3b1646) where performance is
> degraded:

Diff between good and bad case:

    @@ -1,8 +1,8 @@
     PAT memtype list:
     write-back @ 0x55ba4000-0x55ba5000
     write-back @ 0x5e88c000-0x5e8b5000
    -write-back @ 0x5e8b4000-0x5e8b8000
     write-back @ 0x5e8b4000-0x5e8b5000
    +write-back @ 0x5e8b4000-0x5e8b8000
     write-back @ 0x5e8b7000-0x5e8bb000
     write-back @ 0x5e8ba000-0x5e8bc000
     write-back @ 0x5e8bb000-0x5e8be000
    @@ -21,15 +21,15 @@
     uncached-minus @ 0xec260000-0xec264000
     uncached-minus @ 0xec300000-0xec320000
     uncached-minus @ 0xec326000-0xec327000
    -uncached-minus @ 0xf0000000-0xf0001000
     uncached-minus @ 0xf0000000-0xf8000000
    +uncached-minus @ 0xf0000000-0xf0001000
     uncached-minus @ 0xfdc43000-0xfdc44000
     uncached-minus @ 0xfe000000-0xfe001000
     uncached-minus @ 0xfed00000-0xfed01000
     uncached-minus @ 0xfed10000-0xfed16000
     uncached-minus @ 0xfed90000-0xfed91000
    -write-combining @ 0x2000000000-0x2100000000
    -write-combining @ 0x2000000000-0x2100000000
    +uncached-minus @ 0x2000000000-0x2100000000
    +uncached-minus @ 0x2000000000-0x2100000000
     uncached-minus @ 0x2100000000-0x2100001000
     uncached-minus @ 0x2100001000-0x2100002000
     uncached-minus @ 0x2ffff10000-0x2ffff20000

the first two differences are just trivial ordering differences for
overlapping ranges (starting at 0x5e8b4000 and 0xf0000000)
respectively.

But the final difference is a real difference where it used to be WC,
and is now UC-:

    -write-combining @ 0x2000000000-0x2100000000
    -write-combining @ 0x2000000000-0x2100000000
    +uncached-minus @ 0x2000000000-0x2100000000
    +uncached-minus @ 0x2000000000-0x2100000000

which certainly could easily explain the huge performance degradation.

                  Linus
--===============7985978633239129596==--

