Content-Type: multipart/mixed; boundary="===============3793493492742084311=="
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
To: lkp@lists.01.org
Subject: Re: Extending the 0-day system with syzkaller?
Date: Thu, 28 Apr 2016 13:14:47 +0200
Message-ID: <CACT4Y+azAV1c2SnxMqaNXPtxeg4D+ooOiK_adh6PVtBdHj4=8w@mail.gmail.com>
In-Reply-To: <20160428014119.GB28943@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3793493492742084311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2016 at 3:41 AM, Philip Li <philip.li@intel.com> wrote:
> On Wed, Apr 27, 2016 at 11:03:42AM -0700, Kostya Serebryany wrote:
>> Ping...
>> (I know that the recent news at Intel might be quite distracting for some
>> you...)
> hi all, this is Philip from 0day team, sorry for late reply. We are glad =
to add
> syzkaller test suite to 0day, and we will do detail plan of it within thi=
s quarter
> and share with by end of June including what the first step can be and an=
y support
> if needed.
>
> Is this time frame ok? because right now, all resources are booked, and
> formal action may need start next quarter.

Hi Philip,

The time frame is OK

> One quick question is i recall an early discussion is that this enabling =
requires new gcc,
> is this still be true?

Syzkaller requires compiler support. I use new gcc. However, there are
currently patches in flight that add support for gcc plugins to kernel
build system. As far as I understand, with the plugin support no
messing with gcc is required (KCOV instrumentation plugin will also be
in kernel tree).



>> On Fri, Apr 15, 2016 at 1:05 PM, Hart, Darren <darren.hart@intel.com> =
wrote:
>>
>> > Hi Fengguang,
>> >
>> > I met with Kostya at Intel Tech Days and he had some compelling argume=
nts
>> > for including some of these tests.
>> >
>> > Dave H: I took a quick look at Kasan, which appears to require an exis=
ting
>> > config option (CONFIG_KASAN) for dynamic memory access checking using
>> > shadow memory. Is this something you would like to see added to 0-day?=
 Do
>> > we have anything today which provides comparable coverage?
>> >
>> > Combining Kasan and other existing kernel integrity checking, the
>> > syzkaller fuzz tester is showing promising results and the reports com=
e in
>> > the form of kernel oops and similar things which we already check for =
in
>> > 0-day.
>> >
>> > For the others on Cc, do you have additional context for or against
>> > including syzkaller and kasan in 0day?
>> >
>> > Fengguang, what are your thoughts on including these in 0-day?
>> >
>> > Thanks,
>> >
>> > --
>> > Darren Hart
>> > Intel Open Source Technology Center
>> >
>> > On 4/12/16, 10:24 PM, "Kostya Serebryany" <kcc@google.com<mailto:
>> > kcc(a)google.com>> wrote:
>> >
>> > CC-ing more people after today's conversation at the Intel Tech Days.
>> >
>> > We'd like to add kasan and syzkaller [1,2,3,4] to the 0-day kbuild sys=
tem.
>> > We believe this has a large potential to find old bugs and prevent
>> > regressions in the Kernel.
>> > How do we achieve this?
>> >
>> > Thanks,
>> >
>> > --kcc
>> >
>> > [1] https://github.com/google/syzkaller
>> > [2] https://github.com/google/syzkaller/wiki/Found-Bugs
>> > [3] https://lwn.net/Articles/677764/
>> > [4] https://www.kernel.org/doc/Documentation/kasan.txt
>> >
>> >
>> > On Tue, Dec 15, 2015 at 3:49 AM, David Drysdale <drysdale@google.com
>> > <mailto:drysdale@google.com>> wrote:
>> > Hi Fengguang / LKP-folk,
>> >
>> > Quick question -- how easy is it to add extra builds/tests/checks to
>> > your marvellous 0-day kbuild system?
>> >
>> > The reason I ask is that I've recently been exploring syzkaller [1],
>> > which is a system call fuzzer written by some of my colleagues here at
>> > Google (cc'ed).  Although it's fairly new, it has uncovered a bunch of
>> > kernel bugs already [2] so I wondered if it might be a good candidate
>> > for inclusion in the 0-day checks at some point.
>> >
>> > (As an aside, I'm in the process of writing an article about syzkaller
>> > for LWN, which might also expose it to more folk.)
>> >
>> > What do you think?
>> >
>> > Thanks,
>> > David
>> >
>> > [1] https://github.com/google/syzkaller
>> > [2] https://github.com/google/syzkaller/wiki/Found-Bugs
>> >
>> >
>
>> _______________________________________________
>> LKP mailing list
>> LKP(a)lists.01.org
>> https://lists.01.org/mailman/listinfo/lkp
>

--===============3793493492742084311==--

