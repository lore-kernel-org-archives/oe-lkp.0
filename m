Content-Type: multipart/mixed; boundary="===============8657073816810372455=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: efad4e475c [ 40.308255] Oops: 0000 [#1] PREEMPT SMP PTI
Date: Mon, 18 Feb 2019 17:11:49 +0800
Message-ID: <f688387a-6052-6481-57f4-d3b20b2ea3bb@intel.com>
In-Reply-To: <20190218090310.GE4525@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============8657073816810372455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 2/18/19 5:03 PM, Michal Hocko wrote:
> On Mon 18-02-19 16:47:26, Rong Chen wrote:
>> On 2/18/19 3:08 PM, Michal Hocko wrote:
>>> On Mon 18-02-19 13:28:23, kernel test robot wrote:
> [...]
>>>> [   40.305212] PGD 0 P4D 0
>>>> [   40.308255] Oops: 0000 [#1] PREEMPT SMP PTI
>>>> [   40.313055] CPU: 1 PID: 239 Comm: udevd Not tainted 5.0.0-rc4-00149=
-gefad4e4 #1
>>>> [   40.321348] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), =
BIOS 1.10.2-1 04/01/2014
>>>> [   40.330813] RIP: 0010:page_mapping+0x12/0x80
>>>> [   40.335709] Code: 5d c3 48 89 df e8 0e ad 02 00 85 c0 75 da 89 e8 5=
b 5d c3 0f 1f 44 00 00 53 48 89 fb 48 8b 43 08 48 8d 50 ff a8 01 48 0f 45 d=
a <48> 8b 53 08 48 8d 42 ff 83 e2 01 48 0f 44 c3 48 83 38 ff 74 2f 48
>>>> [   40.356704] RSP: 0018:ffff88801fa87cd8 EFLAGS: 00010202
>>>> [   40.362714] RAX: ffffffffffffffff RBX: fffffffffffffffe RCX: 000000=
000000000a
>>>> [   40.370798] RDX: fffffffffffffffe RSI: ffffffff820b9a20 RDI: ffff88=
801e5c0000
>>>> [   40.378830] RBP: 6db6db6db6db6db7 R08: ffff88801e8bb000 R09: 000000=
0001b64d13
>>>> [   40.386902] R10: ffff88801fa87cf8 R11: 0000000000000001 R12: ffff88=
801e640000
>>>> [   40.395033] R13: ffffffff820b9a20 R14: ffff88801f145258 R15: 000000=
0000000001
>>>> [   40.403138] FS:  00007fb2079817c0(0000) GS:ffff88801dd00000(0000) k=
nlGS:0000000000000000
>>>> [   40.412243] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> [   40.418846] CR2: 0000000000000006 CR3: 000000001fa82000 CR4: 000000=
00000006a0
>>>> [   40.426951] Call Trace:
>>>> [   40.429843]  __dump_page+0x14/0x2c0
>>>> [   40.433947]  is_mem_section_removable+0x24c/0x2c0
>>> This looks like we are stumbling over an unitialized struct page again.
>>> Something this patch should prevent from. Could you try to apply [1]
>>> which will make __dump_page more robust so that we do not blow up there
>>> and give some more details in return.
>>
>> Hi Hocko,
>>
>> I have applied [1] and attached the dmesg file.
> Thanks so the log confirms that this is really an unitialized struct
> page
> [   12.228622] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff
> [   12.231474] page dumped because: VM_BUG_ON_PAGE(PagePoisoned(p))
> [   12.232135] ------------[ cut here ]------------
> [   12.232649] kernel BUG at include/linux/mm.h:1020!
>
> So now, we have to find out what has been left behind. Please see my
> other email. Also could you give me faddr2line of the
> is_mem_section_removable offset please? I assume it is
> is_pageblock_removable_nolock:
> 	if (!node_online(page_to_nid(page)))
> 		return false;


faddr2line result:

is_mem_section_removable+0x24c/0x2c0:
page_to_nid at include/linux/mm.h:1020
(inlined by) is_pageblock_removable_nolock at mm/memory_hotplug.c:1221
(inlined by) is_mem_section_removable at mm/memory_hotplug.c:1241

Best Regards,
Rong Chen



--===============8657073816810372455==--

