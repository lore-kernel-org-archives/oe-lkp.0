Content-Type: multipart/mixed; boundary="===============5440722780665671347=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [pipe] d60337eff1: BUG:kernel_NULL_pointer_dereference, address
Date: Mon, 18 Nov 2019 15:53:22 +0800
Message-ID: <35daca93-ff2b-2c7d-b837-72396ca0677a@intel.com>
In-Reply-To: <6853.1573834946@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============5440722780665671347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi David,

Yes, it can fix the problem.

Best Regards,
Rong Chen

On 11/16/2019 12:22 AM, David Howells wrote:
> Actually, no, this is the fix:
>
> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> index 7006b5b2106d..be2fc5793ddd 100644
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -537,7 +537,7 @@ static size_t push_pipe(struct iov_iter *i, size_t si=
ze,
>   		buf->ops =3D &default_pipe_buf_ops;
>   		buf->page =3D page;
>   		buf->offset =3D 0;
> -		buf->len =3D max_t(ssize_t, left, PAGE_SIZE);
> +		buf->len =3D min_t(ssize_t, left, PAGE_SIZE);
>   		left -=3D buf->len;
>   		iter_head++;
>   		pipe->head =3D iter_head;
>
> David
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

--===============5440722780665671347==--

