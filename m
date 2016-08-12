Content-Type: multipart/mixed; boundary="===============8694291245082560742=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 12 Aug 2016 04:52:18 +0200
Message-ID: <20160812025218.GB975@lst.de>
In-Reply-To: <20160812022329.GP19025@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============8694291245082560742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2016 at 12:23:29PM +1000, Dave Chinner wrote:
> Christoph, maybe there's something we can do to only trigger
> speculative prealloc growth checks if the new file size crosses the end of
> the currently allocated block at the EOF. That would chop out a fair
> chunk of the xfs_bmapi_read calls being done in this workload. I'm
> not sure how much effort we should spend optimising this slow path,
> though....

I can look at that, but indeed optimizing this patch seems a bit
stupid.  The other thing we could do is to optimize xfs_bmapi_read - even
if it shouldn't be called this often it seems like it should waste a whole
lot less CPU cycles.

--===============8694291245082560742==--

