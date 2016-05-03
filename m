Content-Type: multipart/mixed; boundary="===============5353107285469500523=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: Extending the 0-day system with syzkaller?
Date: Tue, 03 May 2016 10:05:47 -0700
Message-ID: <CAGXu5j+zb9jdb8X8Fdx4xx3nQSdqKbM_j_qwypSKh+bpKcZ2Uw@mail.gmail.com>
In-Reply-To: <CACT4Y+azAV1c2SnxMqaNXPtxeg4D+ooOiK_adh6PVtBdHj4=8w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5353107285469500523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2016 at 4:14 AM, Dmitry Vyukov <dvyukov@google.com> wrote:
> On Thu, Apr 28, 2016 at 3:41 AM, Philip Li <philip.li@intel.com> wrote:
>> On Wed, Apr 27, 2016 at 11:03:42AM -0700, Kostya Serebryany wrote:
>>> Ping...
>>> (I know that the recent news at Intel might be quite distracting for so=
me
>>> you...)
>> hi all, this is Philip from 0day team, sorry for late reply. We are glad=
 to add
>> syzkaller test suite to 0day, and we will do detail plan of it within th=
is quarter
>> and share with by end of June including what the first step can be and a=
ny support
>> if needed.
>>
>> Is this time frame ok? because right now, all resources are booked, and
>> formal action may need start next quarter.
>
> Hi Philip,
>
> The time frame is OK
>
>> One quick question is i recall an early discussion is that this enabling=
 requires new gcc,
>> is this still be true?
>
> Syzkaller requires compiler support. I use new gcc. However, there are
> currently patches in flight that add support for gcc plugins to kernel
> build system. As far as I understand, with the plugin support no
> messing with gcc is required (KCOV instrumentation plugin will also be
> in kernel tree).

I'm still waiting on the kbuild maintainer to speak up on this series,
so if other folks could chime in on the thread saying they would put
it to good use, I would greatly appreciate that:

https://lkml.org/lkml/2016/4/7/750

-Kees

-- =

Kees Cook
Chrome OS & Brillo Security

--===============5353107285469500523==--

