Content-Type: multipart/mixed; boundary="===============2150144877711137632=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] drm/radeon: Try to init amdkfd only if 64 bit kernel
Date: Tue, 13 Jan 2015 09:15:33 -0800
Message-ID: <CAGXu5jKuzGZKX3osNi7yLAe9Xc-Oj8TXMvXk6jPGmTNzN77JKA@mail.gmail.com>
In-Reply-To: <87mw5v4iug.fsf@rustcorp.com.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============2150144877711137632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2015 at 2:58 PM, Rusty Russell <rusty@rustcorp.com.au> wro=
te:
> Kees Cook <keescook@chromium.org> writes:
>> On Sun, Jan 4, 2015 at 8:28 PM, Rusty Russell <rusty@rustcorp.com.au> =
wrote:
>>> Kees, as far as I can tell you need another 0-terminated vmlinux.relocs
>>> section for weak symbols.  These should not be relocated if already 0.
>>
>> A few questions:
>>
>> Why doesn't this break on 32-bit without kASLR? 32-bit does relocation
>> by default, even without CONFIG_RANDOMIZE_BASE.
>
> Well, the offset was 0 until I removed CONFIG_HIBERNATE.
>
>> Are there any symbols that are NULL that aren't weak? I'd expect all
>> strong symbols to have non-zero offsets, but I must be
>> misunderstanding something here.
>
> I don't think there would be.  Anyway, you might be able to filter them
> out in x86/tools/relocs itself.

I've been travelling last week and this, so I haven't had time to take
a close look yet. Hopefully I can work on this next week or later this
week.

-Kees

-- =

Kees Cook
Chrome OS Security

--===============2150144877711137632==--

