Content-Type: multipart/mixed; boundary="===============3021004989085764606=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [usb] bea5b158ff WARNING: CPU: 0 PID: 25 at drivers/usb/core/urb.c:338 usb_submit_urb
Date: Tue, 28 Feb 2017 12:52:48 +0800
Message-ID: <20170228045248.5inqpcgwq3qumtyk@wfg-t540p.sh.intel.com>
In-Reply-To: <20170228044709.GA19456@b29397-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3021004989085764606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>> The dummy_udc WARN is gone with this patch for 100+ times of boot tests.
>>
>> Tested-by: Xiaolong Ye <xiaolong.ye@intel.com>
>>
>> Thanks,
>> Xiaolong
>>
>
>Thanks, Xiaolong. I will submit a patch for it.

Thank you Peter! We've been noised by this warning for quite some time.

Fengguang

--===============3021004989085764606==--

