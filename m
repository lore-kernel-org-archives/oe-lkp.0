Content-Type: multipart/mixed; boundary="===============8014729579097620413=="
MIME-Version: 1.0
From: Rusty Russell <rusty@rustcorp.com.au>
To: lkp@lists.01.org
Subject: Re: [PATCH] drm/radeon: Try to init amdkfd only if 64 bit kernel
Date: Wed, 07 Jan 2015 09:28:31 +1030
Message-ID: <87mw5v4iug.fsf@rustcorp.com.au>
In-Reply-To: <CAGXu5jJ71tM99uaRoq74AkcB5KhxsfBS3NyDuJ2rJncKmfCWwg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8014729579097620413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Kees Cook <keescook@chromium.org> writes:
> On Sun, Jan 4, 2015 at 8:28 PM, Rusty Russell <rusty@rustcorp.com.au> w=
rote:
>> Kees, as far as I can tell you need another 0-terminated vmlinux.relocs
>> section for weak symbols.  These should not be relocated if already 0.
>
> A few questions:
>
> Why doesn't this break on 32-bit without kASLR? 32-bit does relocation
> by default, even without CONFIG_RANDOMIZE_BASE.

Well, the offset was 0 until I removed CONFIG_HIBERNATE.

> Are there any symbols that are NULL that aren't weak? I'd expect all
> strong symbols to have non-zero offsets, but I must be
> misunderstanding something here.

I don't think there would be.  Anyway, you might be able to filter them
out in x86/tools/relocs itself.

Cheers,
Rusty.

--===============8014729579097620413==--

