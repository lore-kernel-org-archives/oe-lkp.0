Content-Type: multipart/mixed; boundary="===============2532393001668467871=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [x86] d55564cfc2: will-it-scale.per_thread_ops -5.8% regression
Date: Thu, 07 Jan 2021 19:04:45 +0000
Message-ID: <20210107190445.GK3579531@ZenIV.linux.org.uk>
In-Reply-To: <CAHk-=wiZaFRt9hGen9=eOr7LA+Q8o5f980eGEvtxBD6+os7nqA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2532393001668467871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2021 at 10:47:07AM -0800, Linus Torvalds wrote:

> Now, the "whole entry" is just 8 bytes, so it's possible that it would
> actually be faster to do a copy of the whole thing rather than write
> just the 16 bits. But I got very nervous about it, because I could
> easily see some threaded app actually changing the 'fd' (or the
> 'event' field) in place (ie writing -1 to it as they close and re-use
> it)

BTW, changing 'event' field in place from another thread is going to
be interesting - you have two 16bit values next to each other and
two CPUs modifying those with no exclusion.  Sounds like a recipe
for massive trouble...

Or am I missing something here?
--===============2532393001668467871==--

