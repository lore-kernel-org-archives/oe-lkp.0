Content-Type: multipart/mixed; boundary="===============7859854848369822845=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86] 45fc8757d1: BUG:unable_to_handle_kernel
Date: Fri, 17 Mar 2017 11:00:44 -0700
Message-ID: <CA+55aFx2ArTYrdd10A07Y-cD==7yCNE-2kZQcMeAoZKnxFCO2Q@mail.gmail.com>
In-Reply-To: <CA+55aFwx5D1hSaW6ac3D=30cY7=2i4cPmGn9zB-1a8ywpau3cw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7859854848369822845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 10:49 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The linear address can be used to look up which entry it is. I assume
> the GDT starts at ffffffffff577000, and that this is at offset 0x60
> from that. Whatever descriptor that would be..

Hmm. That should be gdt index 12, aka GDT_ENTRY_TLS_MIN.

I guess user space can set almost anything there. Including setting a
segment type that isn't accessed, and that the CPU will change on the
first actual access.

We do have code to verify the limits and types etc iirc, I guess we
can make sure to set the accessed bit too.

              Linus

--===============7859854848369822845==--

