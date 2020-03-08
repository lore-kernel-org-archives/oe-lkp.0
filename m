Content-Type: multipart/mixed; boundary="===============5943965266298062850=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [futex] 8019ad13ef: will-it-scale.per_process_ops -97.8% regression
Date: Sun, 08 Mar 2020 10:28:44 -0500
Message-ID: <CAHk-=whrpL8pbKLg3_s3+bxv6kbPnzbSP8dQkZ+Rv=jAT3aoKw@mail.gmail.com>
In-Reply-To: <CAHk-=wgJV7xrxsTkOG203huPShzZBEC6N_BG0KGwHBmEq4yqWg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5943965266298062850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[ Just a re-send without html crud that makes all the lists unhappy.
I'm still on the road, the flight I was supposed to be on yesterday
got cancelled.. ]

I do note that the futex hashing seems to be broken by that commit. Or
at least it's questionable.  It keeps hashing on "both.word",  and
doesn't use the u64 field at all for hashing.

Maybe I'm mis-reading it - I didn't apply the patch, I just looked at
the patch and my source base separately.

But the 98% regression sure says something went wrong ;)

           Linus

On Sun, Mar 8, 2020 at 9:22 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, Mar 8, 2020, 08:02 kernel test robot <rong.a.chen@intel.com> wr=
ote:
>>
>>
>> FYI, we noticed a -97.8% regression of will-it-scale.per_process_ops due=
 to commit:
>>
>> commit: 8019ad13ef7f64be44d4f892af9c840179009254 ("futex: Fix inode life=
-time issue")
>
> Well, that's not optimal.
>
> Peter, any ideas? One of the things that worried me about changing to
> an u64 was what I think it causes extra padding, I think. And maybe
> that messes with the comparison and hashing of the futexes?
--===============5943965266298062850==--

