Content-Type: multipart/mixed; boundary="===============5656363117062737570=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [blk] 47e0fb461f: BUG:unable_to_handle_kernel
Date: Mon, 09 Oct 2017 16:10:50 +0800
Message-ID: <20171009081050.GA31518@yexl-desktop>
In-Reply-To: <CA+55aFy6GJdq=N1uK7KmdV5XRSBjYv1Sdg=NbjOJsZr_+hadYQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5656363117062737570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/30, Linus Torvalds wrote:
>On Thu, Sep 21, 2017 at 12:02 AM, NeilBrown <neilb@suse.com> wrote:
>>
>> I think it is crashing in
>> static inline bool ata_is_host_link(const struct ata_link *link)
>> {
>>         return link =3D=3D &link->ap->link || link =3D=3D link->ap->slav=
e_link;
>> }
>
>Yes. The code is
>
>  1a: 8b 3a                mov    (%edx),%edi
>  1c: 8d 8f 40 16 00 00    lea    0x1640(%edi),%ecx
>  22: 39 ca                cmp    %ecx,%edx
>  24: 74 49                je     0x6f
>  26: b9 01 00 00 00        mov    $0x1,%ecx
>  2b:* 39 97 80 24 00 00    cmp    %edx,0x2480(%edi) <-- trapping instruct=
ion
>  31: 74 3c                je     0x6f
>
>and that first "je" is the test for "link =3D=3D &link->ap->link" (which
>only takes the address relative to "link->ap" - thus the "lea"), and
>that cmp that oopses is indeed loading that actual slave_link value.
>
>So I agree. "link->ap" is NULL for some odd reason.
>
>Hmm. Absolutely nothing has changed in libata-core.c recently,
>certainly not that async_port_probe() thing.
>
>So I suspect either it's just a timing difference, or it's some
>unrelated memory corruption.
>
>Xiaolong, I see that you have SLUB_DEBUG and SLUB_DEBUG_ON enabled,
>but wonder if you can recreate this with DEBUG_PAGEALLOC and/or
>DEBUG_OBJECTS enabled too?
>

Sorry for the late, just come back from vacation.
I retested with with DEBUG_PAGEALLOC and DEBUG_OBJECTS enabled for both
commit 47e0fb461f and commit 011067b056, and both showed the ata_dev_next
crash issue, so commit 47e0fb461f should be irrelevant, sorry for the noise.

Thanks,
Xiaolong

>Tejun, any ideas? The original report is at
>
>   https://lkml.org/lkml/2017/9/20/939
>
>in case you don't see it in your inbox from lkml.
>
>                       Linus

--===============5656363117062737570==--

