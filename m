Content-Type: multipart/mixed; boundary="===============2202670203928378792=="
MIME-Version: 1.0
From: Dan Williams <dan.j.williams@intel.com>
To: lkp@lists.01.org
Subject: Re: [ahci] 6cb1c51aa6: ahci 0000:00:1f.2: failed to enable MSI-X with error -22, # of vectors: 3
Date: Wed, 11 Nov 2015 09:09:40 -0800
Message-ID: <CAPcyv4hj9LLZsCpvY+Bg3YUYc4SPo8f2OgaEvhq0OrvRanDnfA@mail.gmail.com>
In-Reply-To: <20151111154955.GA6246@mtj.duckdns.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2202670203928378792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2015 at 7:49 AM, Tejun Heo <tj@kernel.org> wrote:
> On Tue, Nov 10, 2015 at 10:16:31AM +0800, kernel test robot wrote:
>> FYI, we noticed the below changes on
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/tj/libata for-4.4
>> commit 6cb1c51aa65039ab3860c9741f9a190b7ab199cb ("ahci: per-port msix su=
pport")
>
> So, this commit didn't end up making 4.4 but will probably get merged
> into for-4.5 once rc1 drops.  Dan, can you please see what's up with
> the error message?
>

Yes, taking a look and will have a new spin of the patches posted after -rc=
1.

--===============2202670203928378792==--

