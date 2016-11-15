Content-Type: multipart/mixed; boundary="===============2016635925932461998=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 34fad54c25: kernel BUG at include/linux/skbuff.h:1935!
Date: Tue, 15 Nov 2016 13:56:58 +0800
Message-ID: <20161115055658.GD2142@yexl-desktop>
In-Reply-To: <1479249843.681.152.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2016635925932461998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/16, Duyck, Alexander H wrote:
>On Wed, 2016-11-16 at 05:20 +0800, kernel test robot wrote:
>From what I can tell it looks like the size of the frame is 0x160 hex,
>or 352. =C2=A0For whatever reason we are only pulling 8 bytes into the
>header which is giving us an skb->len of 352 (0x160), and a skb-
>>data_len of 344 (0x158). =C2=A0When we go to pull the 14 bytes for the
>Ethernet header we end up at a skb->len of 338 (0x152) which is
>resulting in the panic.
>
>The question is how are we coming up with 8 instead of 14 which is the
>lowest limit supported by eth_get_headlen? My first thought was there
>is an incorrect sizeof(eth) instead of the sizeof(*eth) somewhere in
>the code but I can't find anything like that anywhere.
>
>Is there any way you can provide me with the net/ethernet/eth.o and
>drivers/net/ethernet/igb/igb.o files? =C2=A0With that I can look over the

Is vmlinux ok for you? I've sent it to you separately.

Btw: I've also tried gcc-5 (Debian 5.4.1-2) 5.4.1 20160904, and the
result shows the same failures.

Thanks,
Xiaolong

--===============2016635925932461998==--

