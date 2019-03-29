Content-Type: multipart/mixed; boundary="===============0254448871619932235=="
MIME-Version: 1.0
From: Johannes Thumshirn <jthumshirn@suse.de>
To: lkp@lists.01.org
Subject: Re: [block] 4e366a7962: blktests.nvme.005.fail
Date: Fri, 29 Mar 2019 09:06:05 +0100
Message-ID: <7779ab0a-391f-269e-9172-c03151211f85@suse.de>
In-Reply-To: <6cf48b68-a81b-d28e-96dc-0f8185eddec7@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0254448871619932235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 28/03/2019 18:52, Jens Axboe wrote:
> On 3/28/19 11:48 AM, Christoph Hellwig wrote:
>> On Thu, Mar 28, 2019 at 05:31:29PM +0100, Johannes Thumshirn wrote:
>>> In all cases I could reproduce it I had nsegs =3D=3D 2 and
>>> rq->nr_phys_segments =3D=3D 1 (rq->bio->bi_phys_segments =3D=3D 1).
>>
>> And all cases are pass through as well?
>>
>> Can you check if this still shows up with the series from Ming which
>> switches the passthrough requests to use multi-page biovecs aswell
>> and gets rid of the hairy code you quote below.

Good idea, thanks.

> Since I already merged that in my 5.2 but didn't push it out yet, I've
> made a temporary branch available if you want to test through that:
> =

> git://git.kernel.dk/linux-block 5.2-tmp

Awesome thanks.


-- =

Johannes Thumshirn                            SUSE Labs Filesystems
jthumshirn(a)suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)
Key fingerprint =3D EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850

--===============0254448871619932235==--

