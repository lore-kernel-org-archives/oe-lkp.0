Content-Type: multipart/mixed; boundary="===============1800600965725121608=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm/page_owner] 866b485262: invoked_oom-killer:gfp_mask=0x
Date: Fri, 30 Jul 2021 10:31:09 +0200
Message-ID: <d0c1717f-a3e1-a9d4-44b2-2452134ad5e5@suse.cz>
In-Reply-To: <20210729114611.13ff7c1c43c883bd039dab40@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1800600965725121608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/29/21 8:46 PM, Andrew Morton wrote:
> On Thu, 29 Jul 2021 09:40:19 +0800 kernel test robot <oliver.sang@intel=
.com> wrote:
> =

>> =

>> =

>> Greeting,
>> =

>> FYI, we noticed the following commit (built with gcc-9):
>> =

>> commit: 866b485262173a2b873386162b2ddcfbcb542b4a ("mm/page_owner: record=
 the timestamp of all pages during free")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> I don't see how this can happen unless it's a side-effect of making
> struct page_owner 8 bytes larger.

It's possible. Seems to be a 32bit highmem kernel, allocation that fails is
GFP_USER and the page_owner (part of page_ext) has to be in lowmem, even for
highmem pages, and there's not an insignificant amount of it:

[   16.228923][    T0] allocated 178298840 bytes of page_ext

Seems to be one of the cases where contemporary kernel features are not alw=
ays
suitable for 32bit kernels (especially with large memory). The highmem is 1=
6GB.
If it was smaller, it would be actually better.

> Does setting
> /proc/sys/vm/oom_dump_tasks tell us more?
>=20

--===============1800600965725121608==--

