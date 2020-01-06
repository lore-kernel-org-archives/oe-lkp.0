Content-Type: multipart/mixed; boundary="===============7477085077366410522=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [block] f216fdd77b: BUG:kernel_reboot-without-warning_in_boot_stage
Date: Mon, 06 Jan 2020 08:42:32 +0800
Message-ID: <b65813c2-5be1-224b-3094-b067f8f2e7f1@intel.com>
In-Reply-To: <20191209083637.GA15038@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7477085077366410522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 12/9/19 4:36 PM, Christoph Hellwig wrote:
> On Mon, Dec 09, 2019 at 04:08:56PM +0800, Rong Chen wrote:
>> Hi Christoph,
>>
>> Kernel boot failed in early stage with commit "f216fdd77b":
> Well, this config (plus enabling virtio for real) boots just fine for
> me.  There is nothing in your dmesgs, which makes me assume the boot
> stage means really early?  Nothing touched in this commit is involved
> in the very early boot path, though.

Hi Christoph,

Sorry for the inconvenience, it should be a false positive,
but we haven't figure it out yet.

Best Regards,
Rong Chen
--===============7477085077366410522==--

