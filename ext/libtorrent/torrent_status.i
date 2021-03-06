%{
#include "libtorrent/torrent_handle.hpp"
%}

namespace libtorrent {

  struct torrent_status
  {
    torrent_status();

    %rename("paused?") paused;
    bool paused;

    enum state_t
    {
      queued_for_checking,
      checking_files,
      connecting_to_tracker,
      downloading_metadata,
      downloading,
      finished,
      seeding,
      allocating
    };
 
    %immutable;

    state_t state;

    float progress;
    boost::posix_time::time_duration next_announce;
    boost::posix_time::time_duration announce_interval;

    std::string current_tracker;
    size_type total_download;
    size_type total_upload;
    size_type total_payload_download;
    size_type total_payload_upload;
    size_type total_failed_bytes;
    size_type total_redundant_bytes;
    float download_rate;
    float upload_rate;
    float download_payload_rate;
    float upload_payload_rate;
    int num_peers;
    int num_complete;
    int num_incomplete;

    const std::vector<bool>* pieces;
    int num_pieces;
    size_type total_done;
    size_type total_wanted_done;
    size_type total_wanted;
    int num_seeds;
    float distributed_copies;
    int block_size;

    %mutable;
  };

}
