Content-Type: multipart/mixed; boundary="===============2645155874189430245=="
MIME-Version: 1.0
From: Michal Marek <mmarek@suse.cz>
To: lkp@lists.01.org
Subject: Re: [x86] 784d5699ed: kmsg.ip_tables:no_symbol_version_for_copy_from_user
Date: Tue, 11 Oct 2016 15:10:49 +0200
Message-ID: <57FCE4D9.1090904@suse.cz>
In-Reply-To: <20160930092658.0da22cad@canb.auug.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============2645155874189430245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dne 30.9.2016 v 01:26 Stephen Rothwell napsal(a):
> Hi all,
> =

> On Tue, 20 Sep 2016 10:55:32 +0800 kernel test robot <xiaolong.ye@intel=
.com> wrote:
>>
>> FYI, we noticed the following commit:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mast=
er
>> commit 784d5699eddc55878627da20d3fe0c8542e2f1a2 ("x86: move exports to a=
ctual definitions")
>>
>> in testcase: boot
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
>>
>> caused below changes:
>>
>> [    4.386609] ip_tables: no symbol version for _copy_from_user
>> [    4.387902] ip_tables: Unknown symbol _copy_from_user (err -22)
>> [    4.389219] ip_tables: no symbol version for __put_user_2
>> [    4.390473] ip_tables: Unknown symbol __put_user_2 (err -22)
>> [    4.391760] ip_tables: no symbol version for __sw_hweight32
>> [    4.393031] ip_tables: Unknown symbol __sw_hweight32 (err -22)
>> [    4.394332] ip_tables: no symbol version for memcpy
>> [    4.395508] ip_tables: Unknown symbol memcpy (err -22)
>> [    4.396729] ip_tables: no symbol version for __fentry__
>> [    4.397937] ip_tables: Unknown symbol __fentry__ (err -22)
>> [    4.399234] ip_tables: no symbol version for _copy_to_user
>> [    4.400488] ip_tables: Unknown symbol _copy_to_user (err -22)
>> [    4.405835] systemd[1]: Failed to insert module 'ip_tables': Invalid =
argument
>>
>>
>>
>> Thanks,
>> Xiaolong
> =

> Do we have any resolution of this?

With which .config is it happening? In my testing, the undefined CRCs
show up as 0x00000000 in Module.symvers and they are also 0 in the
___kcrctab* sections in vmlinux. So the loader matches the requested and
provided symbol's CRC of 0 and is happy. But I guess I'm missing something.

Thanks,
Michal

--===============2645155874189430245==--

