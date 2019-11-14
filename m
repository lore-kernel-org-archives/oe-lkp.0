Content-Type: multipart/mixed; boundary="===============3805906446832388303=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [LTP] [xfs] 73e5fff98b: kmsg.dev/zero:Can't_open_blockdev
Date: Thu, 14 Nov 2019 08:44:01 +0800
Message-ID: <d0db75cc-440d-6de8-f6d2-ddf399a3bdb7@intel.com>
In-Reply-To: <975334005.11814790.1573625805426.JavaMail.zimbra@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3805906446832388303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 11/13/19 2:16 PM, Jan Stancek wrote:
>
> ----- Original Message -----
>>>>> # mount -t xfs /dev/zero /mnt/xfs
>>> Assuming that is what is being done ...
>> Arrrh, of course, a difference between get_tree_bdev() and
>> mount_bdev() is that get_tree_bdev() prints this message when
>> blkdev_get_by_path() fails whereas mount_bdev() doesn't.
>>
>> Both however do return an error in this case so the behaviour
>> is the same.
>>
>> So I'm calling this not a problem with the subject patch.
>>
>> What needs to be done to resolve this in ltp I don't know?
> I think that's question for kernel test robot, which has this extra
> check built on top. ltp itself doesn't treat this extra message as FAIL.
>
> Jan
>

Hi all,

Thanks for your help, kernel test robot bisected automatically for new =

error:

 =C2=A0=C2=A0 kern=C2=A0 :err=C2=A0=C2=A0 : [=C2=A0 135.993912] /dev/zero: =
Can't open blockdev

Please ignore the report if it's not a problem.

Best Regards,
Rong Chen
--===============3805906446832388303==--

