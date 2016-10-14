Content-Type: multipart/mixed; boundary="===============2335129982430382729=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86] 811565123a: BUG: kernel hang in early-boot stage, last printk: Probing EDD (edd=off to disable)... ok
Date: Fri, 14 Oct 2016 08:46:16 +0800
Message-ID: <20161014004616.GA13114@yexl-desktop>
In-Reply-To: <87vawwc7io.fsf@tassilo.jf.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2335129982430382729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/13, Andi Kleen wrote:
>Andi Kleen <andi@firstfloor.org> writes:
>
>Any comments on this?
>
>I still cannot reproduce the failure unfortunately.

oh, sorry, missed you mail before, I'll try the tests you mentioned and
provide results later.

Thanks,
Xiaolong

>
>
>> Could you do two tests for me:
>>
>> - Enable CONFIG_MICROCODE_INTEL and see if it boots then
>>
>> - Add CONFIG_DEBUG_INFO to the config.
>> Add -s to the qemu command line and boot again. Then when it hangs =

>> connect gdb to see where it hangs
>>
>> gdb -ex "target remote localhost:1234" vmlinux
>> bt
>>
>> <show output>

--===============2335129982430382729==--

