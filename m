Content-Type: multipart/mixed; boundary="===============3236944204917968396=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm/slub] ae107fa919: BUG:unable_to_handle_page_fault_for_address
Date: Mon, 14 Mar 2022 17:20:18 +0100
Message-ID: <3d2872e9-b17f-a9f9-cad1-09a7fff85b5b@suse.cz>
In-Reply-To: <ff4daab3-0ae6-65b9-dbc6-8033cf7ad6a7@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3236944204917968396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/12/22 14:08, Vlastimil Babka wrote:
> On 3/12/22 13:06, Mike Rapoport wrote:
>>>>> Ideas? implementing something like kmem_cache_init_early() again?
>>>>
>>>> I think we could simply make CONFIG_SLUB_DEBUG_ON select/depend on
>>>> STACKDEPOT_ALWAYS_INIT?
>>>
>>> Oh, sounds better.
>>>
>>> If we make CONFIG_SLUB_DEBUG_ON select STACK_DEPOT_ALWAYS_INIT,
>>> that is simple solution. but stackdepot will be initialized on
>>> slub_debug=3D- too.
> =

> Valid point.
> =

>>> But I think no one will set CONFIG_SLUB_DEBUG_ON=3Dy if not debugging...
>> =

>> If memory wasted by stack_table is a real concern, we may free it after
>> parsing slub_debug or add a condition taking into account
>> CONFIG_SLUB_DEBUG_ON and slub_debug=3D- to the =

>> =

>> 	if (slub_debug & SLAB_STORE_USER)
>> 		stack_depot_want_early_init();
>> =

>> But I agree that if somebody runs a kernel with CONFIG_SLUB_DEBUG_ON=3Dy=
, the
>> goal is to have slub debugging on, so making CONFIG_SLUB_DEBUG_ON select
>> STACK_DEPOT_ALWAYS_INIT totally makes sense to me.
> =

> Agree. We had to decouple stackdpepot init from CONFIG_SLUB_DEBUG
> because almost everyone enables CONFIG_SLUB_DEBUG by default, but on
> smaller systems doesn't want to always pay the price even if unused.
> But I don't expect anyone to enable CONFIG_SLUB_DEBUG_ON and then run
> with slub_debug=3D- by default, and complain. If anyone like that exists,
> they could also add the stackdepot_disable parameter.

Pushed fixed version to
https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git
slub-stackdepot-v3r1 for now
As it's too late to target 5.18 now, will post v3 properly after merge
window and add to slab-next towards 5.19 then.

>>> I don't think making CONFIG_SLUB_DEBUG_ON depend on
>>> CONFIG_STACKDEPOT_ALWAYS_INIT is good solution. only KASAN selects it.
>>>
>>> -- =

>>> Thank you, You are awesome!
>>> Hyeonggon :-)
>> =

>=20

--===============3236944204917968396==--

