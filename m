Content-Type: multipart/mixed; boundary="===============2440829792727735580=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] mm: relocate 'write_protect_seq' in struct mm_struct
Date: Tue, 15 Jun 2021 09:11:03 +0800
Message-ID: <20210615011102.GA38780@shbuild999.sh.intel.com>
In-Reply-To: <20210614032738.GA72794@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2440829792727735580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 11:27:39AM +0800, Feng Tang wrote:
> > =

> > It seems Ok to me, but didn't we earlier add the has_pinned which
> > would have changed the layout too? Are we chasing performance delta's
> > nobody cares about?
> =

> Good point! I checked my email folder for 0day's reports, and haven't
> found a report related with Peter's commit 008cfe4418b3 ("mm: Introduce
> mm_struct.has_pinned) which adds 'has_pinned' field. =

> =

> Will run the same test for it and report back.

I run the same will-it-scale/mmap1 case for Peter's commit 008cfe4418b3
and its parent commit, and there is no obvious performance diff:

a1bffa48745afbb5 008cfe4418b3dbda2ff820cdd7b =

---------------- --------------------------- =


    344353            -0.4%     342929        will-it-scale.48.threads
      7173            -0.4%       7144        will-it-scale.per_thread_ops

And from the pahole info for the 2 kernels, Peter's commit adds the
'has_pinned' is put into an existing 4 bytes hole, so all other following =

fields keep their alignment unchanged. Peter may do it purposely =

considering the alignment. So no performance change is expected.

Pahole info for kernel before 008cfe4418b3:

struct mm_struct {
	...
	/* --- cacheline 1 boundary (64 bytes) --- */
	long unsigned int  task_size;            /*    64     8 */
	long unsigned int  highest_vm_end;       /*    72     8 */
	pgd_t *            pgd;                  /*    80     8 */
	atomic_t           membarrier_state;     /*    88     4 */
	atomic_t           mm_users;             /*    92     4 */
	atomic_t           mm_count;             /*    96     4 */

	/* XXX 4 bytes hole, try to pack */

	atomic_long_t      pgtables_bytes;       /*   104     8 */
	int                map_count;            /*   112     4 */
	spinlock_t         page_table_lock;      /*   116     4 */
	struct rw_semaphore mmap_lock;           /*   120    40 */
	/* --- cacheline 2 boundary (128 bytes) was 32 bytes ago --- */

pahold info with 008cfe4418b3:

struct mm_struct {
	...
	/* --- cacheline 1 boundary (64 bytes) --- */
	long unsigned int  task_size;            /*    64     8 */
	long unsigned int  highest_vm_end;       /*    72     8 */
	pgd_t *            pgd;                  /*    80     8 */
	atomic_t           membarrier_state;     /*    88     4 */
	atomic_t           mm_users;             /*    92     4 */
	atomic_t           mm_count;             /*    96     4 */
	atomic_t           has_pinned;           /*   100     4 */
	atomic_long_t      pgtables_bytes;       /*   104     8 */
	int                map_count;            /*   112     4 */
	spinlock_t         page_table_lock;      /*   116     4 */
	struct rw_semaphore mmap_lock;           /*   120    40 */
	/* --- cacheline 2 boundary (128 bytes) was 32 bytes ago --- */
	=

Thanks,
Feng

=20

--===============2440829792727735580==--

