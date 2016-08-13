Content-Type: multipart/mixed; boundary="===============4046538754306269881=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Sun, 14 Aug 2016 06:07:27 +0800
Message-ID: <20160813220727.GA4901@wfg-t540p.sh.intel.com>
In-Reply-To: <20160813214825.GA31667@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4046538754306269881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Sat, Aug 13, 2016 at 11:48:25PM +0200, Christoph Hellwig wrote:
>On Sat, Aug 13, 2016 at 02:30:54AM +0200, Christoph Hellwig wrote:
>> Below is a patch I hacked up this morning to do just that.  It passes
>> xfstests, but I've not done any real benchmarking with it.  If the
>> reduced lookup overhead in it doesn't help enough we'll need to some
>> sort of look aside cache for the information, but I hope that we
>> can avoid that.  And yes, it's a rather large patch - but the old
>> path was so entangled that I couldn't come up with something lighter.
>
>Hi Fengguang or Xiaolong,
>
>any chance to add this thread to a lkp run?

Sure. To which base should I apply it? Or if you already pushed the
git tree, I'll test your commit directly.

Thanks,
Fengguang

--===============4046538754306269881==--

