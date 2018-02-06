Content-Type: multipart/mixed; boundary="===============2077481922055084332=="
MIME-Version: 1.0
From: Marc-Andre Lureau <mlureau@redhat.com>
To: lkp@lists.01.org
Subject: Re: e7e61e51f9 ("fw_cfg: do DMA read operation"): kernel BUG at arch/x86/mm/physaddr.c:75!
Date: Wed, 07 Feb 2018 00:19:39 +0100
Message-ID: <CAMxuvawXOAUvtz01583hFse0XjCMN7bOspvjzDRjpAo_oWTrJQ@mail.gmail.com>
In-Reply-To: <20180206224129-mutt-send-email-mst@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2077481922055084332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Feb 6, 2018 at 10:01 PM, Michael S. Tsirkin <mst@redhat.com> wrot=
e:
> On Fri, Feb 02, 2018 at 11:59:00AM +0100, Marc-Andre Lureau wrote:
>> Hi
>>
>> On Fri, Feb 2, 2018 at 3:19 AM, Michael S. Tsirkin <mst@redhat.com> wr=
ote:
>> > On Fri, Feb 02, 2018 at 06:01:01AM +0800, kernel test robot wrote:
>> That's actually the regression, before Peter patch squashed in v10, we
>> checked if the given address wasn't NULL before doing dma_map_single.
>> Now it is gone and raises the panic.
>>
>> Thus, the diff I propose is:
>>
>> diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_c=
fg.c
>> index 3b3cf6222c97..08309939cd94 100644
>> --- a/drivers/firmware/qemu_fw_cfg.c
>> +++ b/drivers/firmware/qemu_fw_cfg.c
>> @@ -128,7 +128,7 @@ static ssize_t fw_cfg_dma_transfer(struct device *de=
v,
>>         }
>>
>>         *d =3D (struct fw_cfg_dma) {
>> -               .address =3D cpu_to_be64(virt_to_phys(address)),
>> +               .address =3D address ? cpu_to_be64(virt_to_phys(address)=
) : 0,
>>                 .length =3D cpu_to_be32(length),
>>                 .control =3D cpu_to_be32(control)
>>         };
>> @@ -518,7 +518,8 @@ static ssize_t fw_cfg_sysfs_read_raw(struct file
>> *filp, struct kobject *kobj,
>>         if (count > entry->f.size - pos)
>>                 count =3D entry->f.size - pos;
>>
>> -       return fw_cfg_read_blob(dev, entry->f.select, buf, pos, count, t=
rue);
>> +       /* do not use DMA, virt_to_phys(buf) might not be ok */
>> +       return fw_cfg_read_blob(dev, entry->f.select, buf, pos, count, f=
alse);
>>  }
>>
>> (and I tested it works both with x86 and x86_64 kernel/qemu)
>>
>> thanks
>
> Point is there are callers where address is on stack.

Which one do you see left where we don't pass dma=3Dfalse?

> Let's try to do a minimal approach - enable coredump
> writes first. Defer speedups to next version.

Fair enough (although it would have been nice to ask before reaching v12)

--===============2077481922055084332==--

