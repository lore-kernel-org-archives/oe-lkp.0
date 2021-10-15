Content-Type: multipart/mixed; boundary="===============0936008878529285240=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [lib/stackdepot] 1cd8ce52c5: BUG:unable_to_handle_page_fault_for_address
Date: Fri, 15 Oct 2021 10:27:17 +0200
Message-ID: <137e4211-266f-bdb3-6830-e101c27c3be4@suse.cz>
In-Reply-To: <YWgDkjqtJO4e3DM6@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0936008878529285240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/14/21 12:16, Mike Rapoport wrote:
> On Thu, Oct 14, 2021 at 11:33:03AM +0200, Vlastimil Babka wrote:
>> On 10/14/21 10:54, kernel test robot wrote:
>> =

>> In my local testing of the patch, when stackdepot was initialized through
>> page owner init, it was using kvmalloc() so slab_is_available() was true.
>> Looks like the exact order of slab vs page_owner alloc is non-determinis=
tic,
>> could be arch-dependent or just random ordering of init calls. A wrong o=
rder
>> will exploit the apparent fact that slab_is_available() is not a good
>> indicator of using memblock vs page allocator, and we would need a bette=
r one.
>> Thoughts?
> =

> The order of slab vs page_owner is deterministic, but it is different for
> FLATMEM and SPARSEMEM. And page_ext_init_flatmem_late() that initializes
> page_ext for FLATMEM is called exactly between buddy and slab setup:

Oh, so it was due to FLATMEM, thanks for figuring that out!

> static void __init mm_init(void)
> {
> 	...
> =

> 	mem_init();
> 	mem_init_print_info();
> 	/* page_owner must be initialized after buddy is ready */
> 	page_ext_init_flatmem_late();
> 	kmem_cache_init();
> =

> 	...
> }
> =

> I've stared for a while at page_ext init and it seems that the
> page_ext_init_flatmem_late() can be simply dropped because there is anyway
> a call to invoke_init_callbacks() in page_ext_init() that is called much
> later in the boot process.

Yeah, but page_ext_init() only does something for SPARSEMEM, and is empty on
FLATMEM. Otherwise it would be duplicating all the work. So I'll just move
page_ext_init_flatmem_late() below kmem_cache_init() in mm_init(). Thanks
again!


--===============0936008878529285240==--

