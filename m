Content-Type: multipart/mixed; boundary="===============5915414328760404652=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [fs/pipe] 5a519c8fe4: WARNING:at_mm/page_alloc.c:#__alloc_pages
Date: Thu, 21 Apr 2022 09:30:59 -0700
Message-ID: <CAHk-=wgSW3gB1=rf3atv=3Xvn0pNBtKUKJ2VF81ue-xagS7F4w@mail.gmail.com>
In-Reply-To: <CANaxB-yVLCSHAi3QKMYzsSDRYC5Wz05iWx8yrb57cbiJ__5ThA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5915414328760404652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2022 at 8:35 AM Andrei Vagin <avagin@gmail.com> wrote:
>
> The operation of injecting/curing parasite code from the
> process is expensive and requires freezing a process. This is why we
> want to maximize the load that we can carry on for each iteration.

Honestly, it sounds like what you want is just process_vm_readv().

The pipe part sounds like a horrible hacky thing.

I also assume you already tried that, and hit some performance issues.
But it does sound like the better interface, more directly what you
want.

So what are the problems with using process_vm_readv?

                   Linus
--===============5915414328760404652==--

