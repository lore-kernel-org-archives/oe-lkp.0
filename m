Content-Type: multipart/mixed; boundary="===============7886752249768037552=="
MIME-Version: 1.0
From: Yinghai Lu <yinghai@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/KASLR] ed9f007ee6: -- System halted
Date: Tue, 28 Jun 2016 12:49:43 -0700
Message-ID: <CAE9FiQV50UhjJDH89C_T7f2vxFDm7Hpjn78ZKtnfeygQcsf23w@mail.gmail.com>
In-Reply-To: <20160628054354.GA9620@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7886752249768037552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2016 at 10:43 PM, Ye Xiaolong <xiaolong.ye@intel.com> wro=
te:
> On Mon, Jun 27, 2016 at 11:59:37AM -0700, Yinghai Lu wrote:
>>output is:
>>
>>early console in setup code
>>early console in extract_kernel
>>input_data: 0x0000000008fbb276
>>input_len: 0x00000000018c6e00
>>output: 0x0000000001000000
>>output_len: 0x0000000009867c98
>>kernel_total_size: 0x0000000008769000
>>booted via startup_32()
>>Physical KASLR using RDTSC...
>>Virtual KASLR using RDTSC...
>>
>>Decompressing Linux...
>>
>>XZ-compressed data is corrupt
>>
>> -- System halted
>>
>>Can you apply attached debug patch and send out dmesg?
>
> There are 4 patches you attached, do you mean to apply them all based on
> commit ed9f007ee6? I tried and seemed they can't apply clearly on it.

Can you try to apply them all manually ?

should be simple, as it just print stuff.

It should be applied cleanly on current linus tree + tip x86/boot.

Thanks

Yinghai

--===============7886752249768037552==--

