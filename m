Content-Type: multipart/mixed; boundary="===============0288297865140312328=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Thu, 09 Mar 2017 14:25:58 +0100
Message-ID: <58C157E6.1010909@iogearbox.net>
In-Reply-To: <alpine.DEB.2.20.1703091409080.3521@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============0288297865140312328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/09/2017 02:10 PM, Thomas Gleixner wrote:
> On Thu, 9 Mar 2017, Daniel Borkmann wrote:
>> With regard to CPA_FLUSHTLB that Linus mentioned, when I investigated
>> code paths in change_page_attr_set_clr(), I did see that CPA_FLUSHTLB
>> was set each time we switched attrs and a cpa_flush_range() was
>> performed (with the correct number of pages and cache set to 0). That
>> would be a __flush_tlb_all() eventually.
>>
>> Hmm, it indeed might seem likely that this could be an emulation bug.
>
> Which variant of __flush_tlb_all() is used when the test fails?
>
> Check for the following flags in /proc/cpuinfo: pge invpcid

I added the following and booted with both variants:

printk("X86_FEATURE_PGE:%u\n",     static_cpu_has(X86_FEATURE_PGE));
printk("X86_FEATURE_INVPCID:%u\n", static_cpu_has(X86_FEATURE_INVPCID));

"-cpu host" gives:

[    8.326117] X86_FEATURE_PGE:1
[    8.326381] X86_FEATURE_INVPCID:1

"-cpu kvm64" gives:

[    8.517069] X86_FEATURE_PGE:1
[    8.517393] X86_FEATURE_INVPCID:0

Thanks,
Daniel

--===============0288297865140312328==--

