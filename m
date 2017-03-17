Content-Type: multipart/mixed; boundary="===============2454845648291563087=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86] 45fc8757d1: BUG:unable_to_handle_kernel
Date: Fri, 17 Mar 2017 11:07:48 -0700
Message-ID: <CA+55aFzYxqhLoDcepjt4Z3uLRBNdAg5Ou25Uj9vzZO2RfaVrDQ@mail.gmail.com>
In-Reply-To: <CA+55aFx2ArTYrdd10A07Y-cD==7yCNE-2kZQcMeAoZKnxFCO2Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2454845648291563087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 11:00 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Fri, Mar 17, 2017 at 10:49 AM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> The linear address can be used to look up which entry it is. I assume
>> the GDT starts at ffffffffff577000, and that this is at offset 0x60
>> from that. Whatever descriptor that would be..
>
> Hmm. That should be gdt index 12, aka GDT_ENTRY_TLS_MIN.
>
> I guess user space can set almost anything there. Including setting a
> segment type that isn't accessed, and that the CPU will change on the
> first actual access.
>
> We do have code to verify the limits and types etc iirc, I guess we
> can make sure to set the accessed bit too.

Hmm. "fill_ldt()" does this:

        desc->type              =3D (info->read_exec_only ^ 1) << 1;
        desc->type             |=3D info->contents << 2;

which always leaves bit #0 of ->type clear. That's the A bit.

Does the problem go away if we just add a

        desc->type             |=3D 1;

to the end there?

But it is entirely possible that I'm missing something here. It's been
_years_ since I looked at descriptor table entries.

                Linus

--===============2454845648291563087==--

