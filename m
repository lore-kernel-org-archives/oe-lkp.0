Content-Type: multipart/mixed; boundary="===============4502237087170094821=="
MIME-Version: 1.0
From: David Hildenbrand <david@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] 6128b3af2a: UBSAN:shift-out-of-bounds_in(null)
Date: Wed, 20 Oct 2021 09:22:52 +0200
Message-ID: <99b496b7-c465-eac3-d7ad-18a615fe94a7@redhat.com>
In-Reply-To: <87wnm9ovz2.fsf@disp2133>
List-Id: <oe-lkp.lists.linux.dev>

--===============4502237087170094821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 19.10.21 17:49, Eric W. Biederman wrote:
> kernel test robot <oliver.sang@intel.com> writes:
> =

>> Greeting,
>>
>> FYI, we noticed the following commit (built with clang-14):
>>
>> commit: 6128b3af2a5e42386aa7faf37609b57f39fb7d00 ("mm: ignore MAP_DENYWR=
ITE in ksys_mmap_pgoff()")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> I believe this failure is misattributed.  Perhaps your reproducer
> only intermittently reproduces the problem?
> =

> The change in question only contains
> =

> 	flags &=3D ~MAP_DENYWRITE
> =

> After all of the other users of MAP_DENYWRITE had been removed from the
> kernel.  So I don't see how it could possibly be responsible for the
> reported shift out of bounds problem.
> =

> Eric

Thanks for looking into this Eric while I spent the last couple of days
in bed feeling miserable. :)


So we get 9 new instances of "UBSAN:shift-out-of-bounds_in(null)" (NULL
pointer dereference) on 6128b3af2a compared to 6128b3af2a^ (8d0920bde5),
apparently inside ksys_mmap_pgoff() on 32bit.

As we're dealing with a fuzzer, is there any reproducer as sometimes
provided by syzkaller? The report itself is not very helpful when
judging if that patch is actually responsible for what we're seeing.

I agree with Eric that it's rather unlikely that when we stop masking
off a bit that's ignored throughout the kernel, that we suddenly trigger
a NULL pointer de-reference. But I learned that everything is possible ;)

-- =

Thanks,

David / dhildenb

--===============4502237087170094821==--

