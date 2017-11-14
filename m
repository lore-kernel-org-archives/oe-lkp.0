Content-Type: multipart/mixed; boundary="===============3129165235545445043=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: ae4adb2c6b ("Merge 'ath6kl/master' into .."): BUG: kernel hang in boot stage
Date: Tue, 14 Nov 2017 18:20:09 +0800
Message-ID: <20171114102009.mwwn53cpc44altnw@wfg-t540p.sh.intel.com>
In-Reply-To: <87k1yti3dy.fsf@kamboji.qca.qualcomm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3129165235545445043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2017 at 10:03:44AM +0000, Kalle Valo wrote:
>Fengguang Wu <fengguang.wu@intel.com> writes:
>
>> Hi Kalle,
>>
>> On Tue, Nov 14, 2017 at 07:11:13AM +0000, Kalle Valo wrote:
>>>Hi Fengguang,
>>>
>>>kernel test robot <fengguang.wu@intel.com> writes:
>>>
>>>> 0day kernel testing robot got the below dmesg and the first bad commit=
 is
>>>>
>>>> git://internal_merge_and_test_tree devel-catchup-201711130242
>>>>
>>>> commit ae4adb2c6bda4351ba5d054b8c3020c1e7a1cb16
>>>> Merge: 2a231f9390802 fafcab9d72554
>>>> Author:     0day robot <fengguang.wu@intel.com>
>>>> AuthorDate: Mon Nov 13 02:46:46 2017 +0800
>>>> Commit:     0day robot <fengguang.wu@intel.com>
>>>> CommitDate: Mon Nov 13 02:46:46 2017 +0800
>>>>
>>>>     Merge 'ath6kl/master' into devel-catchup-201711130242
>>>>
>>>> 2a231f9390  Merge 'driver-core/driver-core-testing' into devel-catchup=
-201711130242
>>>> fafcab9d72  Add localversion-wireless-testing-ath
>>>> ae4adb2c6b  Merge 'ath6kl/master' into devel-catchup-201711130242
>>>> 7b9e87d2f4  0day head guard for 'devel-catchup-201711130242'
>>>> +-------------------------------------------------+------------+------=
------+------------+------------+
>>>> |                                                 | 2a231f9390 |
>>>> | fafcab9d72 | ae4adb2c6b | 7b9e87d2f4 |
>>>> +-------------------------------------------------+------------+------=
------+------------+------------+
>>>> | boot_successes | 52 | 51 | 0 | 0 |
>>>> | boot_failures | 0 | 0 | 16 | 13 |
>>>> | BUG:kernel_hang_in_boot_stage | 0 | 0 | 10 | 11 |
>>>> | BUG:kernel_reboot-without-warning_in_boot_stage | 0 | 0 | 6 | 2 |
>>>> +-------------------------------------------------+------------+------=
------+------------+------------+
>>>>
>>>>
>>>> Decompressing Linux... Parsing ELF... Performing relocations... done.
>>>> Booting the kernel.
>>>
>>>I don't understand this mail. Can I just ignore it?
>>
>> Yeah please ignore, sorry for the noise!
>>
>> The reported bug here is kernel hang or reboots after the printk
>> "Booting the kernel". It looks not your branch's fault, but rather due
>> to some of these reboot bugs behave differently on kernel rebuilds,
>> thus cheats the bisect.
>
>Great, thanks for the confirmation.
>
>BTW, awesome work with the kbuild bot! It was a great service already
>before and getting even better and better all the time.

Thank you for your appreciations! That said, the system is still not
quite to my expectations. :)

Thanks,
Fengguang

--===============3129165235545445043==--

