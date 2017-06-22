Content-Type: multipart/mixed; boundary="===============5765917488604031741=="
MIME-Version: 1.0
From: Dmitry Safonov <dsafonov@virtuozzo.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 1be7107fbe: kernel_BUG_at_mm/mmap.c
Date: Thu, 22 Jun 2017 13:58:42 +0300
Message-ID: <96e0b5fc-e71e-46d4-a246-5ff9ec65383d@virtuozzo.com>
In-Reply-To: <alpine.LSU.2.11.1706211725260.18020@eggly.anvils>
List-Id: <oe-lkp.lists.linux.dev>

--===============5765917488604031741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/22/2017 04:07 AM, Hugh Dickins wrote:
> On Wed, 21 Jun 2017, Linus Torvalds wrote:
>> On Wed, Jun 21, 2017 at 1:56 PM, Oleg Nesterov <oleg@redhat.com> wrote:
>>>
>>> I understand. My point is that this check was invalidated by stack-guar=
d-page
>>> a long ago, and this means that we add the user-visible change now.
>>
>> Yeah. I guess we could consider it an *old* regression that got fixed,
>> but if people started relying on the regression...
>>
>>>> Do you have a pointer to the report for this regression? I must have m=
issed it.
>>>
>>> See http://marc.info/?t=3D149794523000001&r=3D1&w=3D2
>>
>> Ok.
>>
>> And thinking about it, while that is a silly test-case, the notion of
>> "create top-down segment, then start populating it _before_ moving the
>> stack pointer into it" is actually perfectly valid.
>>
>> So I guess checking against the stack pointer is wrong in that case -
>> at least if the stack pointer isn't inside that vma to begin with.
>>
>> So yes, removing that check looks like the right thing to do for now.
>>
>> Do you want to send me the patch if you already have a commit message et=
c?
> =

> I have a bit of a bad feeling about this.
> =

> Perhaps it's just sentimental attachment to all those weird
> and ancient stack pointer checks in arch/<some>/fault.c.
> =

> We have been inconsistent: cris frv m32r m68k microblaze mn10300
> openrisc powerpc tile um x86 have such checks, the others don't.
> So that's a good reason to delete them.
> =

> But at least at the moment those checks impose some sanity:
> just a page less than we had imagined for several years.
> Once we remove them, they cannot go back.  Should we now
> complicate them with an extra page of slop?
> =

> I'm not entirely persuaded by your pre-population argument:
> it's perfectly possible to prepare a MAP_GROWSDOWN area with
> an initial size, that's populated in a normal way, before handing
> off for stack expansion - isn't it?
> =

> I'd be interested to hear more about that (redhat internal) bug
> report that Oleg mentions: whether it gives stronger grounds for
> making this sudden change than the CRIU testcase.

Well, if all the deal is in CRIU testcase - it can be easily reworked.
The question - will it break anything else?

Maybe it's better to disable this check on the release and enable it
back for v4.13 kernel, so if it'll break some user-space, it'll be
caught on linux-next.

> =

> I can go ahead and create a patch if Oleg is not there at the
> moment - but I might prefer his or your name on it - particularly
> if we're rushing it in before consulting the arch maintainers
> whose work we would be deleting.
> =

> Queasily,
> Hugh
> =


-- =

              Dmitry

--===============5765917488604031741==--

