Content-Type: multipart/mixed; boundary="===============2670045224984317636=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [pipe] 3b844826b6: stress-ng.sigio.ops_per_sec -99.3% regression
Date: Wed, 25 Aug 2021 09:11:19 -0500
Message-ID: <875yvtpqbc.fsf@disp2133>
In-Reply-To: <CAHk-=wgrSmiwUfSGt1RPy5KJ_TLBTP5DB0-vT=PCxQY4C7uANA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2670045224984317636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Tue, Aug 24, 2021 at 10:32 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> We could do the same ugly thing for FASYNC that we do for EPOLLET -
>> make it always fasync on new data, exactly because the previous SIGIO
>> might not have emptied the buffer completely.
>
> The patch would be something like the attached (UNTESTED!)

We have two things going on, a pipe wake up and signal wake up.

Does their order matter?  It feels weird that it is possible that
the data can be read from the pipe and the reader woken up to write
more when the signal that notifies the reader of that state has
not even been queued for delivery.


Eric



>                   Linus
>
>  fs/pipe.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/fs/pipe.c b/fs/pipe.c
> index 678dee2a8228..6d4342bad9f1 100644
> --- a/fs/pipe.c
> +++ b/fs/pipe.c
> @@ -363,10 +363,9 @@ pipe_read(struct kiocb *iocb, struct iov_iter *to)
>  		 * _very_ unlikely case that the pipe was full, but we got
>  		 * no data.
>  		 */
> -		if (unlikely(was_full)) {
> +		if (unlikely(was_full))
>  			wake_up_interruptible_sync_poll(&pipe->wr_wait, EPOLLOUT | EPOLLWRNOR=
M);
> -			kill_fasync(&pipe->fasync_writers, SIGIO, POLL_OUT);
> -		}
> +		kill_fasync(&pipe->fasync_writers, SIGIO, POLL_OUT);
>  =

>  		/*
>  		 * But because we didn't read anything, at this point we can
> @@ -385,12 +384,11 @@ pipe_read(struct kiocb *iocb, struct iov_iter *to)
>  		wake_next_reader =3D false;
>  	__pipe_unlock(pipe);
>  =

> -	if (was_full) {
> +	if (was_full)
>  		wake_up_interruptible_sync_poll(&pipe->wr_wait, EPOLLOUT | EPOLLWRNORM=
);
> -		kill_fasync(&pipe->fasync_writers, SIGIO, POLL_OUT);
> -	}
>  	if (wake_next_reader)
>  		wake_up_interruptible_sync_poll(&pipe->rd_wait, EPOLLIN | EPOLLRDNORM);
> +	kill_fasync(&pipe->fasync_writers, SIGIO, POLL_OUT);
>  	if (ret > 0)
>  		file_accessed(filp);
>  	return ret;
> @@ -565,10 +563,9 @@ pipe_write(struct kiocb *iocb, struct iov_iter *from)
>  		 * become empty while we dropped the lock.
>  		 */
>  		__pipe_unlock(pipe);
> -		if (was_empty) {
> +		if (was_empty)
>  			wake_up_interruptible_sync_poll(&pipe->rd_wait, EPOLLIN | EPOLLRDNORM=
);
> -			kill_fasync(&pipe->fasync_readers, SIGIO, POLL_IN);
> -		}
> +		kill_fasync(&pipe->fasync_readers, SIGIO, POLL_IN);
>  		wait_event_interruptible_exclusive(pipe->wr_wait, pipe_writable(pipe));
>  		__pipe_lock(pipe);
>  		was_empty =3D pipe_empty(pipe->head, pipe->tail);
> @@ -591,10 +588,9 @@ pipe_write(struct kiocb *iocb, struct iov_iter *from)
>  	 * Epoll nonsensically wants a wakeup whether the pipe
>  	 * was already empty or not.
>  	 */
> -	if (was_empty || pipe->poll_usage) {
> +	if (was_empty || pipe->poll_usage)
>  		wake_up_interruptible_sync_poll(&pipe->rd_wait, EPOLLIN | EPOLLRDNORM);
> -		kill_fasync(&pipe->fasync_readers, SIGIO, POLL_IN);
> -	}
> +	kill_fasync(&pipe->fasync_readers, SIGIO, POLL_IN);
>  	if (wake_next_writer)
>  		wake_up_interruptible_sync_poll(&pipe->wr_wait, EPOLLOUT | EPOLLWRNORM=
);
>  	if (ret > 0 && sb_start_write_trylock(file_inode(filp)->i_sb)) {
--===============2670045224984317636==--

